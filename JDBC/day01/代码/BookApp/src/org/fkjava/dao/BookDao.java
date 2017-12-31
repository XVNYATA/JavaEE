package org.fkjava.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.fkjava.bean.Book;
import org.fkjava.bean.User;
import org.fkjava.util.ConnectionFactory;

import com.mysql.fabric.xmlrpc.base.Array;

public class BookDao {

	public BookDao() {
		// TODO Auto-generated constructor stub
	}

	public List<Book> findAllBooks() {
		// 获取连接
		Connection con = ConnectionFactory.getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		// sql语句
		String sql = "select * from tb_book";

		try {
			pstm = con.prepareStatement(sql);

			// 执行sql
			rs = pstm.executeQuery();
			List<Book> booklist = new ArrayList<>();

			// 遍历
			while (rs.next()) {
				Book book = new Book();
				// id
				int id = rs.getInt("id");
				book.setId(id);
				// name
				String name = rs.getString("name");
				book.setName(name);
				// image
				String image = rs.getString("image");
				book.setImage(image);
				// price
				Double price = rs.getDouble("price");
				book.setPrice(price);
				// author
				String author = rs.getString("author");
				book.setAuthor(author);

				booklist.add(book);
			}

			return booklist;
		} catch (SQLException e) {
			// 关闭连接
			ConnectionFactory.closeConnection(rs, pstm, con);
		}

		return null;
	}

}
