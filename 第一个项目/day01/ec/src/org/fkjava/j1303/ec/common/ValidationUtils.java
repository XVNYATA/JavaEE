package org.fkjava.j1303.ec.common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ValidationUtils {

	/**
	 * 验证请求中携带的、用户填写的验证码是否和session中保存的验证码一致。如果一致则验证通过；否则验证不通过。
	 * 
	 * @param request
	 * @return
	 */
	public static synchronized boolean validate(HttpServletRequest request) {
		String validationCode = request.getParameter("validationCode");
		HttpSession session = request.getSession();
		String sessionValidationCode = (String) session
				.getAttribute(Constants.KEY_VALIDATION_CODE);
		// 1.检查浏览器有没有把验证码带回
		if (validationCode == null || validationCode.equals("")) {
			// 请求参数不包含验证码，验证不通过
			return false;
		}
		// 2.检查session是否还有验证码
		else if (sessionValidationCode == null) {
			// Session中没有包含验证码，也是验证不通过
			return false;
		}
		// 3.验证码是否相等
		else if (validationCode.equalsIgnoreCase(sessionValidationCode)) {
			// 验证通过
			// 删除session中保存的验证码
			session.removeAttribute(Constants.KEY_VALIDATION_CODE);
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 判断电子邮件地址是否有效。
	 * 
	 * @param email
	 * @return 如果有效返回true；否则返回false
	 */
	public static boolean checkEmail(String email) {
		Pattern pattern = Pattern
				.compile("[a-zA-Z_0-9]{1,}[@][a-zA-Z_0-9.]{1,}(([.][Cc]{1}[Oo]{1}[Mm]{1})|([.][Nn]{1}[Ee]{1}[Tt]{1})|([.][Oo]{1}[Rr]{1}[Gg]{1})|([.][Mm]{1}[Oo]{1}[Bb]{1}[Ii]{1})|([.][MM]{1}[Ee]{1})|([.][Cc]{1}[Cc]{1})|([.][Bb]{1}[Ii]{1}[Zz]{1})|([.][Tt]{1}[Vv]{1})|([.][Hh]{1}[Kk]{1})|([.][Ii]{1}[Nn]{1}[Ff]{1}[Oo]{1})){1,2}([.][Cc]{1}[Nn]{1}){0,1}$");
		Matcher emailMatcher = pattern.matcher(email);
		if (emailMatcher.matches()) {
			// 电子邮件地址有效
			return true;
		}
		return false;
	}
}
