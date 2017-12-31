package org.oneedu.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.oneedu.vo.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;

/**
 * 利用Spring 提供的 JdbcTemplate帮助我们操作数据库
 * */
public class UserDaoImpl implements UserDaoIf {

	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int create(User user) {
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into tb_user(name,password) ");
		sql.append(" values(?,?) ");
		return jdbcTemplate.update(sql.toString(),
				new Object[] { user.getName(), user.getPassword() });
	}

	@Override
	public void removeUserById(int id) {
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from tb_user ");
		sql.append(" where id = ? ");
		jdbcTemplate.update(sql.toString(), new Object[] { id });

	}

	@Override
	public int findTotal() {
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*)  ");
		sql.append(" from tb_user ");
		return jdbcTemplate.queryForInt(sql.toString());
	}

	/*
	 * @Override public User findUserById(int id) { final User user = new
	 * User(); StringBuffer sql = new StringBuffer();
	 * sql.append(" select id,name,password "); sql.append(" from tb_user ");
	 * sql.append(" where id = ? "); //命令模式 , 如何处理返回的结果交给用户
	 * jdbcTemplate.query(sql.toString(), new Object[]{id},new
	 * RowCallbackHandler() {
	 * 
	 * @Override public void processRow(ResultSet rs) throws SQLException {
	 * user.setName(rs.getString("name"));
	 * user.setPassword(rs.getString("password")); user.setId(rs.getInt("id"));
	 * } }); return user; }
	 */
	public User findUserById(int id) {
		User user = new User();
		StringBuffer sql = new StringBuffer();
		sql.append(" select id,name,password ");
		sql.append(" from tb_user ");
		sql.append(" where id = ? ");
		Map<String, Object> map = jdbcTemplate.queryForMap(sql.toString(),
				new Object[] { id });
		user.setId(id);
		user.setName((String) map.get("name"));
		user.setPassword((String) map.get("password"));
		return user;
	}

	@Override
	public User checkUser(String name, String password) {
		StringBuffer sql = new StringBuffer();
		sql.append(" select id,name,password ");
		sql.append(" from tb_user ");
		sql.append(" where name = ? ");
		sql.append(" and password = ? ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(
				sql.toString(), new Object[] { name, password });
		User user = new User();
		if(result != null){
			Map<String, Object> map = result.get(0);
			user.setId((Integer) map.get("id"));
			user.setName((String) map.get("name"));
			user.setPassword((String) map.get("password"));
		}
		return user;
	}

	@Override
	public List<User> findAllUser() {
		List<User> user_list = new ArrayList<User>();
		StringBuffer sql = new StringBuffer();
		sql.append(" select id,name,password ");
		sql.append(" from tb_user ");
		List<Map<String, Object>> result = jdbcTemplate.queryForList(sql
				.toString());
		System.out.println(result);
		for (Map row : result) {
			User user = new User();
			user.setId((Integer) row.get("id"));
			user.setName((String) row.get("name"));
			user.setPassword((String) row.get("password"));
			user_list.add(user);
		}
		return user_list;
	}

	/*
	 * @Override public List<User> findAllUser() { final List<User> user_list =
	 * new ArrayList<User>(); StringBuffer sql = new StringBuffer();
	 * sql.append(" select id,name,password "); sql.append(" from tb_user ");
	 * //命令模式 , 如何处理返回的结果交给用户 jdbcTemplate.query(sql.toString(), new
	 * RowCallbackHandler() {
	 * 
	 * @Override public void processRow(ResultSet rs) throws SQLException {
	 * System.out.println("------------"); User user = new User();
	 * user.setName(rs.getString("name"));
	 * user.setPassword(rs.getString("password")); user.setId(rs.getInt("id"));
	 * user_list.add(user); } }); return user_list; }
	 */

	public void transfer(String code, double account) {
		StringBuffer sql = new StringBuffer();
		sql.append(" update tb_card ");
		sql.append(" set account = account + ? ");
		sql.append(" where code = ? ");
		getJdbcTemplate()
				.update(sql.toString(), new Object[] { account, code });
	}

	public void draw(String code, double account) {
		StringBuffer sql = new StringBuffer();
		sql.append(" update tb_card ");
		sql.append(" set account = account - ? ");
		sql.append(" where code = ? ");
		getJdbcTemplate()
				.update(sql.toString(), new Object[] { account, code });
	}

}
