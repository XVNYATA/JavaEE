package org.fkjava.j1303.ec.exception;

/**
 * 不支持的方法异常：当请求参数method中的值，无非找到对应的方法时抛出此异常
 * 
 * @author lwq
 * 
 */
public class NotSupportMethodException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8433268634893647840L;
	private String method;

	public NotSupportMethodException(String method) {
		super();
		this.method = method;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	@Override
	public String toString() {
		return "Request method [" + method + "] is not supported!";
	}
}
