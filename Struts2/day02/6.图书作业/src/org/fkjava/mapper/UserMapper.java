package org.fkjava.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.fkjava.bean.User;

/**
 * 持久层接口
 * */
public interface UserMapper {
	
	/**
	 * 登录
	 * */
	@Select("select * from tb_user where loginname = #{loginname} and password = #{password}")
	User find(@Param("loginname") String loginname,@Param("password") String password);
	
}
