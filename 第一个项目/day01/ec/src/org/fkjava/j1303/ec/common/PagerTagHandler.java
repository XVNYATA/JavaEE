package org.fkjava.j1303.ec.common;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 * 分页标签处理类，用于在页面生成HTML以简化分页
 * 
 * @author lwq
 * 
 */
public class PagerTagHandler extends SimpleTagSupport {

	private String formId;
	private Integer maxRows;

	@Override
	public void doTag() throws JspException, IOException {
		StringBuilder pageContent = new StringBuilder();
		// 查找放到request对象中的page对象
		Page page = (Page) this.getJspContext().findAttribute("page");
		pageContent.append("<div style='text-align:center;'>").append("\n");
		pageContent
				.append("<input type='hidden' name='maxRows' id='maxRows'/>")
				.append("\n");
		pageContent.append(
				"<input type='hidden' name='pageNumber' id='pageNumber'/>")
				.append("\n");
		pageContent.append("<script type='text/javascript'>").append("\n");
		pageContent.append("function goto(formId, pageNumber){").append("\n");
		pageContent.append(
				"    document.getElementById('pageNumber').value=pageNumber;")
				.append("\n");
		pageContent.append("    var form = document.getElementById(formId);")
				.append("\n");
		pageContent.append("    form.submit();").append("\n");
		pageContent.append("}").append("\n");
		pageContent.append("</script>").append("\n");
		if (page.getPageNumber() > 1) {
			// 如果当前页码小于总页数，说明后面还有数据，下一页和尾页显示为链接
			pageContent.append("<a href='javascript:goto(\"" + formId
					+ "\", \"1\")'>首页</a>");
			pageContent.append("&nbsp;&nbsp;");
			pageContent.append(
					"<a href='javascript:goto(\"" + formId + "\", \""
							+ (page.getPageNumber() - 1) + "\")'>上一页</a>")
					.append("\n");
		} else {
			// 否则显示为文本
			pageContent.append("首页");
			pageContent.append("&nbsp;&nbsp;");
			pageContent.append("上一页").append("\n");
		}
		pageContent.append("&nbsp;&nbsp;");
		pageContent.append(page.getPageNumber()).append("/")
				.append(page.getPageCount());
		pageContent.append("&nbsp;&nbsp;");
		if (page.getPageNumber() < page.getPageCount()) {
			// 如果当前页码小于总页数，说明后面还有数据，下一页和尾页显示为链接
			pageContent.append("<a href='javascript:goto(\"" + formId
					+ "\", \"" + (page.getPageNumber() + 1) + "\")'>下一页</a>");
			pageContent.append("&nbsp;&nbsp;");
			pageContent.append(
					"<a href='javascript:goto(\"" + formId + "\", \""
							+ (page.getPageCount()) + "\")'>尾页</a>").append(
					"\n");
		} else {
			// 否则显示为文本
			pageContent.append("下一页");
			pageContent.append("&nbsp;&nbsp;");
			pageContent.append("尾页").append("\n");
		}
		pageContent.append("</div>").append("\n");
		pageContent.append("<input type='hidden' name='maxRows' value='").append(maxRows).append("'/>\n");
		// 把生成的HTML脚本输出到JSP页面中，这段HTML会最终在浏览器显示
		JspWriter out = this.getJspContext().getOut();
		out.println(pageContent);
	}

	/**
	 * @return the formId
	 */
	public String getFormId() {
		return formId;
	}

	/**
	 * @param formId
	 *            the formId to set
	 */
	public void setFormId(String formId) {
		this.formId = formId;
	}

	/**
	 * @return the maxRows
	 */
	public Integer getMaxRows() {
		return maxRows;
	}

	/**
	 * @param maxRows
	 *            the maxRows to set
	 */
	public void setMaxRows(Integer maxRows) {
		this.maxRows = maxRows;
	}
}
