package org.fkjava.action;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport {
	
	private String remark;
	
	/**每个文件上传域， 可以在Action中提供3个Field进行封装。*/
	private File pic;
	private String picContentType;
	private String picFileName;
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public File getPic() {
		return pic;
	}

	public void setPic(File pic) {
		this.pic = pic;
	}

	public String getPicContentType() {
		return picContentType;
	}

	public void setPicContentType(String picContentType) {
		this.picContentType = picContentType;
	}

	public String getPicFileName() {
		return picFileName;
	}

	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}

	@Override
	public String execute() throws Exception {
		System.out.println("reamrk --> " + this.remark);
		System.out.println("pic --> " + this.pic);
		System.out.println("picContentType --> " + this.picContentType);
		System.out.println("picFileName --> " + this.picFileName);
		
		// 获取上传文件路径
		String path = ServletActionContext.getServletContext().getRealPath("/images");
		System.out.println(path);
		// 使用Commons-io.jar包中的FileUtils实现文件上传
		// 参数1:上传的文件对象  参数2:上传文件保存路径称
		File file = new File(path + File.separator + this.picFileName);
		FileUtils.copyFile(this.pic, file);
		
		return this.SUCCESS;
	}
	
	

}
