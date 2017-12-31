package org.fkjava.dao;

import java.beans.PropertyDescriptor;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.fkjava.bean.User;
import org.fkjava.exception.DataAccessException;
import org.fkjava.util.ConnectionFactory;

/**
 * 如果实现接口，也不确定实参，需要先声明BasicDaoImple<T>(声明变量T)
 * BasicDaoImple<T>还是形参，使用者需要传递实参
 * */
public abstract class BasicDaoImple<T> implements BasicDao<T> {
	
	private Class<?> entity;
	private String tableName;

	public BasicDaoImple() {
		super();
//		System.out.println("BasicDaoImple() -->>");
		// 获得当前对象的Class
		Class<?> clazz = this.getClass();
//		System.out.println("clazz -->> " + clazz);
		// 任何一个Class都有一个Type父接口（类型）
		Type type = clazz.getGenericSuperclass();
//		System.out.println("type -->> " + type);
		// 强制成参数化类型
		ParameterizedType pType = (ParameterizedType)type;
		// 获得当前参数类型的参数[类型]数组
		// org.fkjava.dao.BasicDaoImple<org.fkjava.bean.User> 一个元素
		// Map<Integer, String> 两个元素
		Type[] pTypes = pType.getActualTypeArguments();
		entity = (Class)pTypes[0];
//		System.out.println("entity -->> " + entity);
		tableName = "tb_" + entity.getSimpleName();
		
	}

	@Override
	public void remove(Integer id) {
//		System.out.println("remove -->> ");
		this.template(new CallbackListener<Object>() {

			@Override
			public Object doInCallback(Connection con, PreparedStatement pstm,
					ResultSet rs) throws Exception {
//				System.out.println("doInCallback -->> ");
				// sql
				String sql = " delete from "+tableName+" where id = ? ";
				System.out.println(sql);
				pstm = con.prepareStatement(sql);
				
				pstm.setObject(1, id);
				pstm.executeUpdate();
				
				return null;
			}
		});
		
	}

	@Override
	public void remove() {
		this.template(new CallbackListener<Object>() {

			@Override
			public Object doInCallback(Connection con, PreparedStatement pstm,
					ResultSet rs) throws Exception {
				// sql
				String sql = " delete from "+tableName;
				System.out.println(sql);
				pstm = con.prepareStatement(sql);
				pstm.executeUpdate();
				return null;
			}
		});
		
	}

	/**
	 * 通用的保存方法
	 * @param T t 泛型对象
	 * @return 插入成功返回主键
	 * sql：insert into table(column...) values(?...)
	 * */
	@Override
	public Serializable save(T t) {
		return this.template(new CallbackListener<Serializable>() {

			@Override
			public Serializable doInCallback(Connection con,
					PreparedStatement pstm, ResultSet rs) throws Exception {
				/***************构建SQL******************************/
				// sql
				StringBuffer sql = new StringBuffer();
				sql.append(" insert into ").append(tableName).append(" (");
				// 对象的每一个字段对应表的每一列
				Field[] fields = entity.getDeclaredFields();
				// 循环每一列
				for(Field field : fields){
					// mysql是不用插入id
					if(!field.getName().equals("id")){
						sql.append(field.getName()).append(",");
					}
				}
				// 减去最后一个","
				sql.deleteCharAt(sql.length() - 1);
				sql.append(" ) values( ");
				// 有多少列就有多个个?号
				for(Field field : fields){
					// mysql是不用插入id
					if(!field.getName().equals("id")){
						sql.append("?,");
					}
				}
				sql.deleteCharAt(sql.length() - 1);
				sql.append(" ) ");
				System.out.println(sql.toString());
				/***************构建SQL******************************/
				// 需要返回主键
				pstm = con.prepareStatement(sql.toString(),new String[]{"id"});
				/***************设置参数******************************/
				int parameterIndex = 1;
				for(Field field : fields){
					if(!field.getName().equals("id")){
						// 不破坏封装
						PropertyDescriptor pd 
							= new PropertyDescriptor(field.getName(),entity);
						// 获取get方法
						Method getMethod = pd.getReadMethod();
						// 从参数T上面获得字段的值
						Object value = getMethod.invoke(t);
						// 设置值
						pstm.setObject(parameterIndex++, value);
					}
				}
				// 执行
				int result = pstm.executeUpdate();
				/***************返回主键******************************/
				if(result > 0){
					// 获得生成主键的结果集
					rs = pstm.getGeneratedKeys();
					// 向下
					rs.next();
					// 取出第一列
					Object key = rs.getObject(1);
					// 返回
					return (Serializable)key;
				}
				return null;
			}
		});
	}

	/**
	 * 通用的修改方法
	 * @param T t 泛型对象
	 * sql：update table set column=?... where id = ?
	 * */
	@Override
	public void update(T t) {
		this.template(new CallbackListener<Object>() {

			@Override
			public Object doInCallback(Connection con, PreparedStatement pstm,
					ResultSet rs) throws Exception {
				/***********构建SQL*******************************/
				StringBuffer sql = new StringBuffer();
				sql.append(" update ").append(tableName).append(" set ");
				// 获得所有字段
				Field[] fields = entity.getDeclaredFields();
				for(Field field : fields){
					if(!field.getName().equals("id")){
						sql.append(field.getName()).append("=?,");
					}
				}
				sql.deleteCharAt(sql.length() - 1);
				sql.append(" where id = ?");
				System.out.println(sql.toString());
				/***********设置参数*******************************/
				pstm = con.prepareStatement(sql.toString());
				int parameterIndex = 1;
				for(Field field : fields){
					if(!field.getName().equals("id")){
						PropertyDescriptor pd 
							= new PropertyDescriptor(field.getName(), entity);
						Method getMethod = pd.getReadMethod();
						pstm.setObject(parameterIndex++, getMethod.invoke(t));
					}
				}
				// 最后一个id赋值
				PropertyDescriptor pd 
				= new PropertyDescriptor("id", entity);
				Method getMethod = pd.getReadMethod();
				pstm.setObject(parameterIndex++, getMethod.invoke(t));
				// 执行
				pstm.executeUpdate();
				return null;
			}
		});
		
	}

	/**
	 * 思路：
	 * 1. 定义sql，发送查询，返回rs
	 * 2. 将对象封装成T(User,Book)返回
	 *    （1）创建对象
	 *    （2）找到结果集里面的每一列（元数据）
	 *    （3）将结果集每一列的值设置到对象对应的属性当中
	 * */
	@Override
	public T get(Integer id) {
		return this.template(new CallbackListener<T>() {

			@Override
			public T doInCallback(Connection con, PreparedStatement pstm,
					ResultSet rs) throws Exception {
				// sql
				String sql = " select * from " + tableName + " where id = ?";
				System.out.println(sql);
				// PreparedStatement
				pstm = con.prepareStatement(sql);
				// 设置参数
				pstm.setObject(1, id);
				// 执行查询
				rs = pstm.executeQuery();
				// 获得结果集rs的元数据对象
				ResultSetMetaData rsmd = rs.getMetaData();
				// 遍历
				if(rs.next()){
					/**
					 * jdbc写法
					  	User user = new User();
						user.setId(rs.getInt("id"));
						user.setUsername(rs.getString("username"));
						return user;
					 * */
					// 创建对象（返回的T对象）
					Object instance = entity.newInstance();
					// 循环每一列
					for(int i = 1; i <= rsmd.getColumnCount();i++){
						// 获取列名 id loginname 
						String columnName = rsmd.getColumnName(i);
						// 获取列值 rs.getInt("id")
						Object columnValue = rs.getObject(columnName);
						/** 通过列的名称找到对应的Field，因为列名=字段名
						 Field field = this.entity.getDeclaredField(columnName);
						 直接使用field的set方法赋值会破坏封装，建议使用Property
						 * */
						// 获取对应的对象的属性描述器 propertyName[属性名字段名]=columnName[列名]
						PropertyDescriptor pd 
							= new PropertyDescriptor(columnName, entity);
						// 获取set方法
						Method setMethod = pd.getWriteMethod();
						// 调用set方法 setId(columnValue)
						setMethod.invoke(instance, columnValue);
					}
					// 返回
					return (T)instance;
				}
				
				return null;
			}
		});
	}

	/**
	 * getAll和get的区别
	 * 1. 创建List<T>集合
	 * 2. sql语句
	 * 3. 不要设置参数
	 * 4. if改成while
	 * 5. while中每一个对象添加到list集合
	 * 6. 返回集合
	 * */
	@Override
	public List<T> get() {
		return this.template(new CallbackListener<List<T>>() {

			@Override
			public List<T> doInCallback(Connection con, PreparedStatement pstm,
					ResultSet rs) throws Exception {
				List<T> list = new ArrayList<T>();
				// sql
				String sql = " select * from " + tableName;
				System.out.println(sql);
				// PreparedStatement
				pstm = con.prepareStatement(sql);
				// 执行查询
				rs = pstm.executeQuery();
				// 获得结果集rs的元数据对象
				ResultSetMetaData rsmd = rs.getMetaData();
				// 遍历
				while(rs.next()){
					/**
					 * jdbc写法
					  	User user = new User();
						user.setId(rs.getInt("id"));
						user.setUsername(rs.getString("username"));
						return user;
					 * */
					// 创建对象（返回的T对象）
					Object instance = entity.newInstance();
					// 循环每一列
					for(int i = 1; i <= rsmd.getColumnCount();i++){
						// 获取列名 id loginname 
						String columnName = rsmd.getColumnName(i);
						// 获取列值 rs.getInt("id")
						Object columnValue = rs.getObject(columnName);
						/** 通过列的名称找到对应的Field，因为列名=字段名
						 Field field = this.entity.getDeclaredField(columnName);
						 直接使用field的set方法赋值会破坏封装，建议使用Property
						 * */
						// 获取对应的对象的属性描述器 propertyName[属性名字段名]=columnName[列名]
						PropertyDescriptor pd 
							= new PropertyDescriptor(columnName, entity);
						// 获取set方法
						Method setMethod = pd.getWriteMethod();
						// 调用set方法 setId(columnValue)
						setMethod.invoke(instance, columnValue);
					}
					// 返回
					list.add((T)instance);
				}
				
				return list;
			}
		});
	}

	/**
	 * 回调接口
	 * @param <E>
	 */
	protected interface CallbackListener<E> {
		/**
		 * 回调方法，只处理实际的DAO操作，不必关心con、pstm和rs的资源释放等问题
		 * 
		 * @param conn
		 * @param pstmt
		 * @param rs
		 * @return E 
		 * @throws Throwable
		 * 用户是save、delete、update或者select交给用户去完成
		 */
		E doInCallback(Connection con,PreparedStatement pstm,ResultSet rs) throws Exception;
	
	}

	/**
	 * 数据操作的模板方法
	 * @param <E>
	 * @param callback接口
	 * @return 返回回调方法的返回值
	 * @throws DataAccessException
	 *             所有回调方法所抛出方法都会被包装成此运行时异常,该异常extends RuntimeException
	 * @see {@link Callback}
	 * 现阶段这个方法就是帮我们做了获取连接和关闭连接的动作,之后还可以处理事务操作
	 * <E> E 代表该方法是一个泛型方法
	 */
	protected <E> E template(CallbackListener<E> callback) throws DataAccessException{
//		System.out.println("template -->>");
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			con = ConnectionFactory.getConnection();
//			System.out.println("获取连接 -->>" + con);
			// 用户操作
			return callback.doInCallback(con, pstm, rs);
		} catch (Exception e) {
			e.printStackTrace();
			// 抛出异常
			throw new DataAccessException(e);
		}finally{
//			System.out.println("finally关闭资源 -->>" );
			ConnectionFactory.close(con, pstm, rs);
		}
	}
	
	/**
	 * 复杂的个性化的select语句
	 * @param String query 要执行的sql语句
	 * @param Object... params  可变参数
	 * @return 查询的结果的list集合
	 * 
	 * UserDaoImpl:
	 *  select * from tb_user where loginname=? and password = ?
	 *  select * from tb_student where class_id = ?
	 *  
	 *  思路：
	 *  1. 获取Statment
	 *  2. 设置参数
	 *  3. 执行查询
	 *  4. 返回结果
	 * */
	List<T> query(String query,Object... params){
		return this.template(new CallbackListener<List<T>>() {

			@Override
			public List<T> doInCallback(Connection con, PreparedStatement pstm,
					ResultSet rs) throws Exception {
				System.out.println(query);
				List<T> list = new ArrayList<T>();
				pstm = con.prepareStatement(query);
				// 设置参数
				if(params != null && params.length > 0){
					int parameterIndex = 1;
					for(Object p : params){
						pstm.setObject(parameterIndex++, p);
					}
				}
				// 执行返回结果集
				rs = pstm.executeQuery();
				ResultSetMetaData rsmd = rs.getMetaData();
				while(rs.next()){
					// 创建对象 
					Object instance = entity.newInstance();
					for(int i = 1;i <= rsmd.getColumnCount();i++){
						// 列名
						String columnName = rsmd.getColumnName(i);
						// 列值
						Object columnValue = rs.getObject(columnName);
						// 获得对应的属性描述器
						PropertyDescriptor pd 
							= new PropertyDescriptor(columnName, entity);
						// 获得set方法
						Method setMethod = pd.getWriteMethod();
						// 调用set方法
						setMethod.invoke(instance, columnValue);
					}
					// 将对象添加到集合
					list.add((T)instance);
				}
				
				return list;
			}
		});
	}
	
	/**
	 * 复杂的select语句,一般是多表查询
	 * select * from tb_stuent s ,tb_clazz c where s.clazz_id = c.id
	 * @param String query 要执行的sql语句
	 * @param Object... params  可变参数
	 * @return 查询的结果的list集合(其中每一行数据就是一个Map,列名为key,值为value)
	 * List{map{id=1,name=jack},map{id=2,name=rose}}
	 * */
	List<Map<String,Object>> queryList(String query,Object... params){
		
		return this.template(new CallbackListener<List<Map<String,Object>>>() {

			@Override
			public List<Map<String, Object>> doInCallback(Connection con,
					PreparedStatement pstm, ResultSet rs) throws Exception {
				List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
				pstm = con.prepareStatement(query);
				// 设置参数
				if(params != null && params.length > 0){
					int parameterIndex = 1;
					for(Object p : params){
						pstm.setObject(parameterIndex++, p);
					}
				}
				rs = pstm.executeQuery();
				ResultSetMetaData rsmd = rs.getMetaData();
				while(rs.next()){
					// 每一条数据使用一个map存储
					Map<String, Object> row = new HashMap<String, Object>();
					// 遍历每一列
					for(int i = 1;i<=rsmd.getColumnCount();i++){
						// 列名
						String columnName = rsmd.getColumnName(i);
						// 列值
						Object columnValue = rs.getObject(columnName);
						// 保存到map
						row.put(columnName, columnValue);
					}
					list.add(row);
				}
				return list;
			}
		});
	}
	
	/**
	 * 复杂的DML语句
	 * delete from tb_user where adderss = ? and sex = ?
	 * update from tb_book where author = ? and pree = ?
	 * @param String query 要执行的sql语句
	 * @param Object... params  可变参数
	 * @return 查询的结果的list集合
	 * */
	Integer executeDML(String dml,Object... params){
		return this.template(new CallbackListener<Integer>() {

			@Override
			public Integer doInCallback(Connection con, PreparedStatement pstm,
					ResultSet rs) throws Exception {
				pstm = con.prepareStatement(dml);
				// 设置参数
				if(params != null && params.length > 0){
					int parameterIndex = 1;
					for(Object p : params){
						pstm.setObject(parameterIndex++, p);
					}
				}
				return pstm.executeUpdate();
			}
		});
	}
	
}
