package org.fkjava.j1303.ec.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.fkjava.j1303.ec.common.Constants;

/**
 * Servlet implementation class ValidationCodeServlet
 */
@WebServlet("/validationCode")
public class ValidationCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * 生成的图片中包含的所有字符集。也可以随机生成
	 */
	private static final char[] CHARS = { '1', '2', '3', '4', '5', '6', '7',
			'8', '9', '0', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
			'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
			'X', 'Y', 'Z', };

	private static Random random = new Random();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ValidationCodeServlet() {
		super();
	}

	/**
	 * 生成随机字符串，内容从{@link #CHARS}中获取
	 * 
	 * @return
	 */
	private static String getRandomString() {
		StringBuilder buffer = new StringBuilder();
		for (int i = 0; i < 4; i++) {
			buffer.append(CHARS[random.nextInt(CHARS.length)]);
		}
		return buffer.toString();
	}

	/**
	 * 获取随机颜色
	 * 
	 * @return
	 */
	private static Color getRandomColor() {
		return new Color(random.nextInt(255), random.nextInt(255),
				random.nextInt(255));
	}

	/**
	 * 获取反转的颜色
	 * 
	 * @param c
	 * @return
	 */
	private static Color getReverseColor(Color c) {
		return new Color(255 - c.getRed(), 255 - c.getGreen(),
				255 - c.getBlue());
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 设置响应的内容类，如果不设置的话，浏览器无法正常识别
		response.setContentType("image/jpeg");
		// 获取随机的验证码
		String radomString = getRandomString();
		// 使用session保存随机的验证码，用于校验
		HttpSession session = request.getSession();
		session.setAttribute(Constants.KEY_VALIDATION_CODE, radomString);
		// 获取随机的颜色，用于绘制画布
		Color color = getRandomColor();
		// 随机颜色反转后，用于绘制验证码
		Color reverse = getReverseColor(color);
		// 创建一个内存中的图片
		// 长、宽、颜色方案
		BufferedImage bi = new BufferedImage(50, 25, BufferedImage.TYPE_INT_RGB);
		// 获取画笔(用于绘制图形)
		Graphics2D g = bi.createGraphics();
		// 设置字体、字号（相当于画笔的大小和风格）
		g.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
		// 设置画笔的颜色
		g.setColor(color);
		// 用画笔填充一个区域
		g.fillRect(0, 0, 50, 25);
		// 设置画笔反转颜色，避免画布和字符的颜色一致而无法辨认
		g.setColor(reverse);
		// 在画布上绘制字符串
		g.drawString(radomString, 5, 20);
		// 绘制干扰内容（点的形式）
		for (int i = 0, n = random.nextInt(100); i < n; i++) {
			g.drawRect(random.nextInt(100), random.nextInt(30), 1, 1);
		}
		// 通过响应获取到输出的字节流，用于输出图片
		OutputStream out = response.getOutputStream();
		ImageIO.write(bi, "jpeg", out);
		// 使用OutputStream的时候，必须把流刷出，否则数据会丢失
		out.flush();
		// 也可以直接close，因为close的时候会自动调用flush
		out.close();
	}
}
