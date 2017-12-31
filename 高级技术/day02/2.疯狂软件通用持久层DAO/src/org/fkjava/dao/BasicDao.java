package org.fkjava.dao;

import java.io.Serializable;
import java.util.List;

/**
 * 持久层的上层父类，封装DAO层的重复代码
 * tb_book:
 * 
 * save(Book book)  remove(Integer id)  remove() 
 * update(Book book) find(Integer id) findAll()
 * 个性化方法
 * List<Book> findByAuthor(String author)
 * 
 * tb_user
 * 
 * save(User user)  remove(Integer id)  remove() 
 * update(User user) find(Integer id) findAll()
 * 个性化方法
 * User login(String loginname,String password)
 * 
 * Collection
 *   -- List 数组，有索引  get(int index)
 *   -- Set
 * 
 * 规则：javabean的名称对应table的名称，属性对应列名
 *      User          tb_user
 *      name		  name
 *      sex			  sex
 *     
 * 泛型<>可以允许所有的大写字母，常用T（type），E（Element）
 * say(String name)  形参
 * obj.say("jack")   实参
 * */
public interface BasicDao<T> {

	/**
	 * 根据id删除数据
	 * @param 要删除的id
	 * sql：delete from table where id = ?
	 * */
	void remove(Integer id);
	
	/**
	 * 删除所有数据
	 * sql：delete from table 
	 * */
	void remove();
	
	/**
	 * 通用的保存方法
	 * @param T t 泛型对象
	 * @return 插入成功返回主键
	 * sql：insert into table(column...) values(?...)
	 * */
	Serializable save(T t);
	
	/**
	 * 通用的修改方法
	 * @param T t 泛型对象
	 * sql：update table set column=?... where id = ?
	 * */
	void update(T t);
	
	/**
	 * 通用的根据id查询数据
	 * @param id 要查询id
	 * sql：select * from table where id = ?
	 * */
	T get(Integer id);
	
	/**
	 * 查询所有数据
	 * sql：select * from table 
	 * */
	List<T> get();
	
}
