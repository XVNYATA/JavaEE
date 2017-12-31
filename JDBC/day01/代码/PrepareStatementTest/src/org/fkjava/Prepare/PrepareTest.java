package org.fkjava.Prepare;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class PrepareTest {

	public PrepareTest() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		selectInfoSecond("Jss", "'123456' or 1=1");
		//selectInfo("Jss", "'123456' or 1=1");
	}
	
	//PrepareStatement
		public static void selectInfoSecond(String username, String password) {
			
			//获取连接
			try {
				Class.forName("com.mysql.jdbc.Driver");
				//连接
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/j1604", "root", "123456");
				//sql语句
				String sql = "select * from tb_stu where username = ? and pass = ?";
				//PrepareStatement 船
				PreparedStatement pstm = con.prepareStatement(sql);
				//设置值
				pstm.setString(1, username);
				pstm.setString(2, password);
				
				ResultSet rs = pstm.executeQuery();
				
				while (rs.next()) {
					 int id = rs.getInt("id");
					String uname = rs.getString("username");
					String pass = rs.getString("pass");
					String remark = rs.getString("remark");
					
					System.out.println("id:"+id+" username:"+uname+" password:"+pass+ " remark:"+remark);
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
	
	
	//Statement
	public static void selectInfo(String username, String password) {
		
		//获取连接
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//连接
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/j1604", "root", "123456");
			//sql语句
			String sql = "select * from tb_stu where username = '"+username+"' and pass = "+password;
			//Statement 船
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			
			while (rs.next()) {
				 int id = rs.getInt("id");
				String uname = rs.getString("username");
				String pass = rs.getString("pass");
				String remark = rs.getString("remark");
				
				System.out.println("id:"+id+" username:"+uname+" password:"+pass+ " remark:"+remark);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
