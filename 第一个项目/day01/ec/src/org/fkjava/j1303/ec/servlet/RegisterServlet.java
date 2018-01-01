package org.fkjava.j1303.ec.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fkjava.j1303.ec.common.ValidationUtils;
import org.fkjava.j1303.ec.entity.model.User;
import org.fkjava.j1303.ec.exception.UserIsAlreadyExistsException;
import org.fkjava.j1303.ec.service.UserService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 校验图片验证码是否正确
		boolean isSucceed = ValidationUtils.validate(request);
		if (!isSucceed) {
			// 验证失败时，提示用户重新输入
			request.setAttribute("validationError", "验证码不正确，请开启Cookie并重试");
			// 返回到注册页面
			request.getRequestDispatcher("/register.jsp").forward(request,
					response);
		} else {
			// 验证通过，进行注册流程
			// 校验填写的数据是否完整、准确
			if (validateRequest(request)) {
				// 请求是有效的
				String loginName = request.getParameter("loginName");
				String password = request.getParameter("passWord");
				String name = request.getParameter("name");
				String sex = request.getParameter("sex");
				String address = request.getParameter("address");
				String phone = request.getParameter("phone");

				User user = new User();
				user.setLoginName(loginName);
				user.setPassWord(password);
				user.setName(name);
				user.setSex(Integer.parseInt(sex));
				user.setAddress(address);
				user.setPhone(phone);
				user.setEmail(loginName);

				// 调用用户服务添加用户
				try {
					boolean addSucceed = UserService.getUserService().addUser(
							user);

					// 用户添加成功后，跳转到登录界面进行登录
					// response.sendRedirect(request.getContextPath() +
					// "/login.jsp");
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<html>\n");
					out.println("    <head>\n");
					out.println("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
					out.println("        <meta http-equiv=\"Refresh\" content=\"5;URL="
							+ request.getContextPath()
							+ "/login.jsp"
							+ "\"/>\n");
					out.println("    </head>\n");
					out.print("    <body>");
					out.print("用户注册成功，5秒后跳转到登录界面进行登录，如长时间未跳转，请点击 <a href='"
							+ request.getContextPath() + "/login.jsp"
							+ "'>这里</a>");
					out.print("    </body>\n");
					out.println("</html>\n");
					out.close();
				} catch (UserIsAlreadyExistsException ex) {
					request.setAttribute("tip", "用户 [" + ex.getLoginName()
							+ "]已经存在，不能重复注册！");
					// 返回到注册页面
					request.getRequestDispatcher("/register.jsp").forward(
							request, response);
				}
			} else {
				// 请求是无效的
				// 返回到注册页面
				request.getRequestDispatcher("/register.jsp").forward(request,
						response);
			}
		}
	}

	/**
	 * 校验填写的数据是否完整、准确
	 * 
	 * @param request
	 * @return
	 */
	private boolean validateRequest(HttpServletRequest request) {
		String loginName = request.getParameter("loginName");
		String password = request.getParameter("passWord");
		String okPassWord = request.getParameter("okPassWord");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		// 校验数据
		boolean validated = true;
		List<String> validationErrorMessage = new LinkedList<>();
		if (loginName == null || loginName.equals("")) {
			// 登录名不能为空
			validated = false;
			validationErrorMessage.add("登录名不能为空");
		}
		if (name == null || name.equals("")) {
			// 真实姓名不能为空
			validated = false;
			validationErrorMessage.add("真实姓名不能为空");
		}
		if (sex == null || sex.equals("")) {
			// 性别不能为空
			validated = false;
			validationErrorMessage.add("性别不能为空");
		}
		if (address == null || address.equals("")) {
			// 联系地址不能为空
			validated = false;
			validationErrorMessage.add("联系地址不能为空");
		}
		if (phone == null || phone.equals("")) {
			// 联系电话不能为空
			validated = false;
			validationErrorMessage.add("联系电话不能为空");
		}
		if (!sex.equals("1") && !sex.equals("2")) {
			// 性别的取值不是1或者2，为无效取值
			validated = false;
			validationErrorMessage.add("性别填写错误，必须选择“男”或者“女”");
		}
		boolean emailChecked = ValidationUtils.checkEmail(loginName);
		if (!emailChecked) {
			// 登录名不是有效的电子邮件地址
			validated = false;
			validationErrorMessage.add("登录名不是有效的电子邮件地址");
		}
		if (password == null || password.equals("")) {
			// 密码不能为空
			validated = false;
			validationErrorMessage.add("密码不能为空");
		}
		if (okPassWord == null || okPassWord.equals("")) {
			// 确认密码不能为空
			validated = false;
			validationErrorMessage.add("确认密码不能为空");
		}
		if (okPassWord != null && !okPassWord.equals(password)) {
			// 两次输入的密码不一致
			validated = false;
			validationErrorMessage.add("两次输入的密码不一致");
		}
		request.setAttribute("validationErrorMessages", validationErrorMessage);
		return validated;
	}
}
