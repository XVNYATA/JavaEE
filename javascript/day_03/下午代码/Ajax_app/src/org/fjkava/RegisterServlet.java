package org.fjkava;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 异步校验用户信息
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("-------doGet------");
		 //获取登录名
		String name = request.getParameter("name");
		//校验name是否存在
		if(name!=null&&name.equals("admin")){
			//设置编码
			response.setCharacterEncoding("utf-8");
			//将信息响应至前台
			response.getWriter().print("您输入的登录名已存在,请从新输入！");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("-----------doPost-----------");
        //获取登录名
		String name = request.getParameter("name");
		//校验name是否存在
		if(name!=null&&name.equals("admin")){
			//设置编码
			response.setCharacterEncoding("utf-8");
			//将信息响应至前台
			response.getWriter().print("您输入的登录名已存在,请从新输入！");
		}
		
		
	}

}
