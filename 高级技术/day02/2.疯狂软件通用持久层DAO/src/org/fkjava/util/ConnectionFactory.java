package org.fkjava.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;


public class ConnectionFactory {
	
	// 读取配置文件的Properties
	private static Properties pro;
	
	// 初始化读取classpath下面的db.properties文件
	static{
		InputStream is = null;
		try {
			is = ConnectionFactory.class.getResourceAsStream("/db.properties");
			// 将db.properties文件的内容加载到Properties中
			pro = new Properties();
			pro.load(is);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	

	// 获取连接
	public static Connection getConnection(){
		try {
			Class.forName(pro.getProperty("driver"));
			return DriverManager.getConnection(
					pro.getProperty("url"),
					pro.getProperty("user"),
					pro.getProperty("password"));
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 关闭资源
	public static void close(Connection con,Statement stm,ResultSet rs){
		try {
			if(rs != null) rs.close();
			if(stm != null) stm.close();
			if(con != null) con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
