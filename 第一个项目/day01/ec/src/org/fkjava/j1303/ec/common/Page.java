package org.fkjava.j1303.ec.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * 分页参数封装对象
 * 
 * @author lwq
 * 
 */
public class Page {

	/**
	 * 总记录行数
	 */
	private int rowsCount;
	/**
	 * 每页行数
	 */
	private int maxRows;
	/**
	 * 页码——即当前第几页
	 */
	private int pageNumber;
	/**
	 * 查询条件封装
	 */
	private Map<String, Object> searchConditions = new HashMap<>();

	/**
	 * @param maxRows
	 *            每页最大记录数
	 * @param pageNumber
	 *            当前页码数
	 */
	private Page(int maxRows, int pageNumber) {
		super();
		this.maxRows = maxRows;
		this.pageNumber = pageNumber;
	}

	/**
	 * 从请求参数中获取分页条件，如果请求参数中的分页条件不完整或者有异常，则使用默认的分页条件。
	 * 
	 * @param request
	 * @return
	 */
	public static Page getPage(HttpServletRequest request) {
		// 整理分页参数
		String rows = request.getParameter("maxRows");
		String number = request.getParameter("pageNumber");
		int maxRows;
		try {
			maxRows = Integer.parseInt(rows);
		} catch (Exception ex) {
			// 如果无法把页码参数每页的总记录数转换成数字，默认是每页5行记录
			maxRows = 3;
		}
		int pageNumber;
		try {
			pageNumber = Integer.parseInt(number);
		} catch (Exception ex) {
			// 如果无法把页码转换成数字，默认是第一页
			pageNumber = 1;
		}
		Page page = new Page(maxRows, pageNumber);

		// 在请求域中保存分页对象，以便在页面使用
		request.setAttribute("page", page);
		return page;
	}

	public void setRowsCount(int rowsCount) {
		this.rowsCount = rowsCount;
	}

	/**
	 * @return the rowsCount
	 */
	public int getRowsCount() {
		return rowsCount;
	}

	/**
	 * @return the maxRows
	 */
	public int getMaxRows() {
		return maxRows;
	}

	/**
	 * @return the pageNumber
	 */
	public int getPageNumber() {

		if (pageNumber < 1) {
			// 页码不能是小于1的，所以这里强制把页码最小值设置为1
			pageNumber = 1;
		} else {
			int pageCount = this.getPageCount();
			if (pageNumber > pageCount) {
				// 页码也不能超过最大页面数，如果超过则把页码设置为最大页码数
				pageNumber = this.getPageCount();
			}
		}
		return pageNumber;
	}

	/**
	 * @return 计算总页数
	 */
	public int getPageCount() {
		// 总记录数除以每页记录数，得到总页数
		double pages = (double) this.getRowsCount()
				/ (double) this.getMaxRows();
		// 如果有小数点，则向上取整。因为小数点表示最后一页的记录数不足每页记录数，但它也是一页。
		pages = Math.ceil(pages);
		return (int) pages;
	}

	/**
	 * @return 计算开始行数
	 */
	public int getStartRow() {
		// MySQL数据库的记录数从0开始计算
		// 第一页的开始记录数是1，比如：0 * 20
		// 第二也的开始记录数是 (页码-1) * 每页记录数
		int start = (this.getPageNumber() - 1) * this.getMaxRows();
		return start;
	}

	/**
	 * @return the searchConditions
	 */
	public Map<String, Object> getSearchConditions() {
		return searchConditions;
	}

	/**
	 * @param maxRows the maxRows to set
	 */
	public void setMaxRows(int maxRows) {
		this.maxRows = maxRows;
	}
}
