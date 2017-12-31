package org.fkjava.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.fkjava.bean.User;
import org.fkjava.util.ConnectionFactory;

public class UserDao {

	public UserDao() {
		// TODO Auto-generated constructor stub
	}

	public User findUserByNameAndPassWord(String name, String pass) {

		// 获取连接
		Connection con = ConnectionFactory.getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		// sql语句
		String sql = "select * from tb_user where loginname=? and password=?";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, name);
			pstm.setString(2, pass);

			// 执行sql
			rs = pstm.executeQuery();

			// 遍历
			while (rs.next()) {
				User user = new User();
				String username = rs.getString("username");
				user.setUsername(username);
				return user;
			}
		} catch (SQLException e) {
			// 关闭连接
			ConnectionFactory.closeConnection(rs, pstm, con);
		}
		return null;
	}

}
