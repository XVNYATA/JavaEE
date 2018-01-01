package org.fkjava.Conn;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class Conn {

	public static void main(String[] args) {
		// TODO Auto-generated method stub	
		
		//查找数据
		try {
			// 连接数据库
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/j1604", "root", "123456");
			System.out.println("你真帅，获取连接：" + con);
			// SQL 语句
			String sql = "Select * from tb_book";
			// 创建 Statement （容器）
			Statement sta = con.createStatement();
			// 执行数据
			ResultSet res = sta.executeQuery(sql);
			
			while(res.next()) {
				//获取数据
				/*
				//id
				int id = res.getInt("id");
				//name
				String name = res.getString("name");
				//remark
				String remark = res.getString("remark");
				
				System.out.println("id："+id+" name : "+name+" remark : "+remark);
				*/
				
				int id = res.getInt(1);
				//name
				String name = res.getString("name");
				//remark
				String remark = res.getString("remark");
				
				System.out.println("id："+id+" name : "+name+" remark : "+remark);
			}
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("哥找不到，你来打我啊。");
		}

	}
	
	public static void DeleteData() {
		
		//删除数据
				try {
					// 连接数据库
					Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/j1604", "root", "123456");
					System.out.println("你真帅，获取连接：" + con);
					// SQL 语句
					String sql = "Delete from tb_book where id = '2'";
					// 创建 Statement （容器）
					Statement sta = con.createStatement();
					// 执行数据
					int flag = sta.executeUpdate(sql);
					// 返回的布尔值
					// false 表示没有数据返回。 
					// true 表示有数据返回。
					System.out.println("是否有数据返回："+flag);

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("哥找不到，你来打我啊。");
				}
	}
	
	public static void UpdateData() {
		
		// 更新数据
				try {
					// 连接数据库
					Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/j1604", "root", "123456");
					System.out.println("你真帅，获取连接：" + con);
					// SQL 语句
					String sql = "UPDATE tb_book set name = '疯狂书籍'";
					// 创建 Statement （容器）
					Statement sta = con.createStatement();
					// 执行数据
					int flag = sta.executeUpdate(sql);
					// 返回的布尔值
					// false 表示没有数据返回。 
					// true 表示有数据返回。
					System.out.println("是否有数据返回："+flag);

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("哥找不到，你来打我啊。");
				}
	}
	
	public static void InserData() {
		// 插入数据
		try {
			// 连接数据库
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/j1604", "root", "123456");
			System.out.println("你真帅，获取连接：" + con);
			// SQL 语句
			//String sql = "INSERT INTO tb_book(name , remark) values('疯狂Java讲义', '这本书是李钢写的。')";
			String sql = "INSERT INTO tb_book(name , remark) values('疯狂iOS讲义', '这本书是李钢写的。')";
			// 创建 Statement （容器）
			Statement sta = con.createStatement();
			// 执行数据
			boolean flag = sta.execute(sql);
			// 返回的布尔值
			// false 表示没有数据返回。 
			// true 表示有数据返回。
			System.out.println("是否有数据返回："+flag);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("哥找不到，你来打我啊。");
		}
	}
	
	public static void createTable() {
		
		// 创建表
				try {
					// 连接数据库
					Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/j1604", "root", "123456");
					System.out.println("你真帅，获取连接：" + con);
					// SQL 语句
					String sql = "CREATE TABLE tb_book (id INT PRIMARY KEY AUTO_INCREMENT, "
							+ "NAME VARCHAR(20),  REMARK VARCHAR(100))";
					// 创建 Statement （容器）
					Statement sta = con.createStatement();
					// 执行数据
					boolean flag = sta.execute(sql);
					// 返回的布尔值
					// false 表示没有数据返回。 
					// true 表示有数据返回。
					System.out.println("是否有数据返回："+flag);

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("哥找不到，你来打我啊。");
				}

	}

	public static void methodFourth() {

		// 获取连接
		try {
			// 连接数据库
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/j1604", "root", "123456");
			System.out.println("你真帅，获取连接：" + con);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("哥找不到，你来打我啊。");
		}
	}

	public static void methoudThird() {

		// 获取连接
		try {
			// 获取驱动
			Class.forName("com.mysql.jdbc.Driver");
			// 连接数据库
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/j1604", "root", "123456");
			System.out.println("你真帅，获取连接：" + con);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("哥找不到，你来打我啊。");
		}

	}

	public static void methodSecond() {
		// 获取连接
		try {
			// 获取驱动
			Driver driver = new com.mysql.jdbc.Driver();
			// 使用 DriverManger 注册驱动
			DriverManager.registerDriver(driver);
			// 连接数据库
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/j1604", "root", "123456");
			System.out.println("你真帅，获取连接：" + con);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("哥找不到，你来打我啊。");
		}
	}

	public static void methodOne() {

		// 获取连接
		try {
			// 获取驱动
			Driver driver = new com.mysql.jdbc.Driver();
			// 获取属性（用户名，密码）
			Properties info = new Properties();
			info.setProperty("user", "root");
			info.setProperty("password", "123456");
			// 连接数据库
			Connection con = driver.connect("jdbc:mysql://127.0.0.1:3306/j1604", info);
			System.out.println("你真帅，获取连接：" + con);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("哥找不到，你来打我啊。");
		}

	}

}
