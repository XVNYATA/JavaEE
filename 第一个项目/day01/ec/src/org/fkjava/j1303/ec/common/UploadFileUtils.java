package org.fkjava.j1303.ec.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UploadFileUtils {

	private static Logger logger = LoggerFactory
			.getLogger(UploadFileUtils.class);

	/**
	 * 把请求中的图片文件保存的磁盘上
	 * 
	 * @param request
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	public static Map<String, String> saveImages(HttpServletRequest request)
			throws IllegalStateException, IOException, ServletException {
		// 获取项目布署的真实路径
		String realPath = request.getServletContext().getRealPath(
				"/images/article/");
		// 判断文件上传到服务器的存储路径是否存在
		File dir = new File(realPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		Map<String, String> fileMap = new HashMap<>();

		// ----------------文件上传的表单属性------------------
		Collection<Part> parts = request.getParts();
		for (Part part : parts) {
			String contentType = part.getContentType();
			// 只有当contentType属性不为空，并且是以image开头的时候，这部分的内容才是一个图片
			if (contentType != null && contentType.startsWith("image")) {
				// 输入框的name属性的值
				String name = part.getName();
				// 保存图片文件，并返回保存后的文件名
				String newFileName = saveImage(realPath, part);
				fileMap.put(name, newFileName);
			}
		}
		return fileMap;
	}

	public static String saveImage(String realPath, Part part)
			throws IOException {

		// 获取content-disposition头信息
		String contentDisposition = part.getHeader("content-disposition");
		// 获取文件名
		String fileName = contentDisposition.substring(contentDisposition
				.indexOf("filename=\"") + 10);
		fileName = fileName.substring(0, fileName.indexOf("\""));
		// 文件的扩展名
		String suffix = fileName.substring(fileName.lastIndexOf("."));

		// 生成新的文件名，该文件名需要保存到数据库
		String newFileName = UUID.randomUUID().toString() + suffix;
		logger.info("上传的文件被保存到 " + newFileName);
		String savePath = realPath + File.separator + newFileName;
		// 创建File对象
		File file = new File(savePath);
		// 创建文件输出流
		FileOutputStream fileOutput = new FileOutputStream(file);
		// 获取文件的输入流
		InputStream fileInput = part.getInputStream();

		// 初始化读取缓存，用于从输入流中读取数据
		byte[] buffer = new byte[1024];
		// 从输入流中把数据读取到缓存
		int total = fileInput.read(buffer);
		while (total != -1) {
			// 把放到缓存中的数据，写入到输出流，输出到文件
			fileOutput.write(buffer, 0, total);

			// 循环从输入流中读取数据
			total = fileInput.read(buffer);
		}
		// 释放资源
		fileOutput.flush();
		fileOutput.close();
		fileInput.close();

		return newFileName;
	}
}
