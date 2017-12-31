package org.fkjava.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

// 一个Java要响应请求，必须实现Servlet接口  为什么要实现接口？
public class HelloServlet implements Servlet{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void init(ServletConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	// 响应请求的方法   为什么是响应的方法?
	// 通过web.xml和服务器进行沟通
	/**
	 * @param ServletRequest request  请求对象  封装所有请求信息
	 * @param ServletResponse response 响应对象
	 * */
	@Override
	public void service(ServletRequest request, ServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("接收到请求......");
		
		// 测试请求对象
		// 获得传输协议
		String protocol = request.getProtocol();
		// 获得远程地址
		String remoteHost = request.getRemoteHost();
		System.out.println("protocol：" + protocol);
		System.out.println("remoteHost：" + remoteHost);
		
		// 返回一句欢迎语句helloworld
		// 从响应对象获得输出流
		PrintWriter out = response.getWriter();
		out.println("helloworld");
		out.flush(); // 刷新
		out.close(); // 关闭
		
	}

}
