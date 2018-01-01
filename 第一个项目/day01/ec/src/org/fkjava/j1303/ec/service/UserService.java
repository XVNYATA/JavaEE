package org.fkjava.j1303.ec.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.fkjava.j1303.ec.common.MyBatisSessionFactory;
import org.fkjava.j1303.ec.entity.mapper.UserMapper;
import org.fkjava.j1303.ec.entity.model.User;
import org.fkjava.j1303.ec.entity.model.UserExample;
import org.fkjava.j1303.ec.entity.model.UserExample.Criteria;
import org.fkjava.j1303.ec.exception.MultiUserFoundException;
import org.fkjava.j1303.ec.exception.UserIsAlreadyExistsException;

public class UserService {
	private static UserService userService = new UserService();

	private UserService() {
	}

	public static UserService getUserService() {
		return userService;
	}

	/**
	 * 添加用户信息到数据库。例如用于注册新用的时候
	 * 
	 * @param user
	 * @return
	 */
	public boolean addUser(User user) {
		// 检查用户是否已经注册过
		User oldUser = this.findUserByLoginName(user.getLoginName());
		if (oldUser != null) {
			// 如果已经注册，返回到注册界面，并提示用户
			throw new UserIsAlreadyExistsException(user.getLoginName());
		}// 如果未注册，继续下一步

		// 获取一个数据库的会话
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		try {
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			// 检查是否为第一个用户
			int count = userMapper.countByExample(null);
			if (count == 0) {
				// 如果是第一个用户，设置role为管理员，2是管理员
				user.setRole(2);
			} else {
				// 如果不是第一个用户，设置role为普通用户，1是普通用户
				user.setRole(1);
			}
			user.setCreateDate(new Date());
			// 把用户信息写入到数据库中
			userMapper.insert(user);
			// 提交事务
			sqlSession.commit();
		} finally {
		}
		return true;
	}

	/**
	 * 根据登录名查询用户信息。例如用于登录的时候
	 * 
	 * @param loginName
	 * @return
	 */
	public User findUserByLoginName(String loginName) {
		// 获取一个数据库的会话
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		try {
			// 获取用户映射操作接口
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			// 构建查询条件
			UserExample example = new UserExample();
			Criteria criteria = example.createCriteria();
			// 表示只查询未禁用的账户
			criteria.andDisabledEqualTo(Boolean.FALSE);
			// 登录名等于参数传入的，才检索出来
			criteria.andLoginNameEqualTo(loginName);
			// 使用查询条件查询符合条件的用户
			// 由于查询条件中，只设置了一个登录名，所以只有符合登录名的用户会被返回
			List<User> userList = userMapper.selectByExample(example);
			if (userList.size() == 1) {
				// 找到用户
				User user = userList.get(0);
				return user;
			} else if (userList.size() > 1) {
				// 根据登录名找到超过一个用户，表示数据错误，这是不应该存在的。
				// 如果数据库设置了登录名是唯一键，这个条件永远不会进来
				throw new MultiUserFoundException(loginName);
			} else {
				// 未找到用户
				// 提示用户登录名错误
				return null;
			}
		} finally {
		}
	}

	/**
	 * 查询用户列表
	 * 
	 * @return
	 */
	public List<User> list(String name) {
		// 获取一个数据库的会话
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		try {
			// 获取用户映射操作接口
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			UserExample example = new UserExample();
			Criteria criteria = example.createCriteria();
			// 表示只查询未禁用的账户
			criteria.andDisabledEqualTo(Boolean.FALSE);
			if (name != null) {
				// 把参数前后加上%，以便模糊搜索
				criteria.andNameLike("%" + name + "%");
			}
			List<User> userList = userMapper.selectByExample(example);
			return userList;
		} finally {
		}
	}

	public void delete(int userId) {
		// 获取一个数据库的会话
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		try {
			// 获取用户映射操作接口
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			// 从数据库中根据用户ID查询用户记录出来
			User user = userMapper.selectByPrimaryKey(userId);
			// 构建更新数据的条件
			UserExample example = new UserExample();
			example.createCriteria().andIdEqualTo(userId);
			// 设置用户已经被禁用
			user.setDisabled(Boolean.TRUE);
			// 根据更新条件，更新用户记录
			userMapper.updateByExample(user, example);

			// 提交事务，否则更新不会保存到数据库中
			sqlSession.commit();
		} finally {
		}
	}

	public User getUserById(int userId) {
		// 获取一个数据库的会话
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		try {
			// 获取用户映射操作接口
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			// 从数据库中根据用户ID查询用户记录出来
			User user = userMapper.selectByPrimaryKey(userId);
			return user;
		} finally {
		}
	}

	public void update(User user) {
		// 获取一个数据库的会话
		SqlSession sqlSession = MyBatisSessionFactory.getSession();
		try {
			// 获取用户映射操作接口
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);

			// 构建更新数据的条件
			UserExample example = new UserExample();
			example.createCriteria().andIdEqualTo(user.getId());
			// 根据更新条件，更新用户记录
			userMapper.updateByExample(user, example);

			// 提交事务，否则更新不会保存到数据库中
			sqlSession.commit();
		} finally {
		}
	}
}
