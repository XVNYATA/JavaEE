package org.fkit.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.reflection.wrapper.MapWrapper;
import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.fkit.domain.User;
import org.fkit.factory.FKSqlSessionFactory;

public class SelectMapTest {

	public static void main(String[] args) throws Exception {
		// 获得Session实例
		SqlSession session = FKSqlSessionFactory.getSqlSession();
		// 查询TB_USER表所有数据返回List集合,集合中的每个元素都是一个Map
		List<Map<String,Object>> list 
			= session.selectList("org.fkit.mapper.UserMapper.selectUser");
		// 遍历List集合，打印每一个Map对象
		for(Map<String,Object> row : list){
			System.out.println(row);
		}
		// 提交事务
		session.commit();
		// 关闭Session
		session.close();
	}

}
