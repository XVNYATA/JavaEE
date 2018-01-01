package org.fkjava.j1303.ec.entity.generator;

import java.util.List;

import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.PluginAdapter;

/**
 * 由于数据库表可能会有前缀（比如我们现在的是叫EC_），而该前缀在Java代码里面是没有意义的，因此在生成代码的时候我们需要通过一个插件把这个前缀去掉。
 * 
 * @author lwq
 * 
 */
public class ModelRenamingPlugin extends PluginAdapter {

	private String prefix = "EC_";

	@Override
	public boolean validate(List<String> warnings) {
		return true;
	}

	/**
	 * 初始化每个表的生成之时调用该方法——拦截每个表的处理。
	 * 
	 * @see org.mybatis.generator.api.PluginAdapter#initialized(org.mybatis.generator.api.IntrospectedTable)
	 */
	public void initialized(IntrospectedTable introspectedTable) {
		// 处理Model的类名
		String baseRecordType = introspectedTable.getBaseRecordType();
		baseRecordType = this.replaceJavaPrefix(baseRecordType);
		introspectedTable.setBaseRecordType(baseRecordType);

		// 处理Example.java的类名
		String exampleType = introspectedTable.getExampleType();
		exampleType = this.replaceJavaPrefix(exampleType);
		introspectedTable.setExampleType(exampleType);

		// 处理Mapper.java文件的类名
		String DAOInterfaceType = introspectedTable.getDAOInterfaceType();
		DAOInterfaceType = this.replaceJavaPrefix(DAOInterfaceType);
		introspectedTable.setDAOInterfaceType(DAOInterfaceType);

		// 处理Mapper.xml文件的类名
		String mybatis3JavaMapperType = introspectedTable
				.getMyBatis3JavaMapperType();
		mybatis3JavaMapperType = this.replaceJavaPrefix(mybatis3JavaMapperType);
		introspectedTable.setMyBatis3JavaMapperType(mybatis3JavaMapperType);

		String mybatis3XmlMapperFileName = mybatis3JavaMapperType
				.substring(mybatis3JavaMapperType.lastIndexOf(".") + 1);
		mybatis3XmlMapperFileName = mybatis3XmlMapperFileName + ".xml";
		introspectedTable
				.setMyBatis3XmlMapperFileName(mybatis3XmlMapperFileName);

		String primaryKeyType = introspectedTable.getPrimaryKeyType();
		primaryKeyType = this.replaceJavaPrefix(primaryKeyType);
		introspectedTable.setPrimaryKeyType(primaryKeyType);

		// String sqlMapFileName = null;
		// introspectedTable.setIbatis2SqlMapFileName(sqlMapFileName);

		String sqlMapFileName = introspectedTable.getIbatis2SqlMapFileName();
		sqlMapFileName = replaceTablePrefix(sqlMapFileName);
		introspectedTable.setIbatis2SqlMapFileName(sqlMapFileName);

		String sqlMapNamespace = introspectedTable.getIbatis2SqlMapNamespace();
		sqlMapNamespace = replaceTablePrefix(sqlMapNamespace);
		introspectedTable.setIbatis2SqlMapNamespace(sqlMapNamespace);
	}

	/**
	 * 把类名中的前缀去掉
	 * 
	 * @param source
	 * @return
	 */
	private String replaceJavaPrefix(String source) {

		String prefix = this.prefix;
		prefix = prefix.toLowerCase();
		prefix = prefix.replace("_", "");
		String first = prefix.substring(0, 1);
		prefix = prefix.substring(1);

		first = first.toUpperCase();
		prefix = first + prefix;

		StringBuilder builder = new StringBuilder(source);
		int lastDotIndex = builder.lastIndexOf(".") + 1;
		String className = builder.substring(lastDotIndex);
		if (className.indexOf(prefix) == 0) {
			builder.delete(lastDotIndex, lastDotIndex + prefix.length());
		}
		return builder.toString();
	}

	private String replaceTablePrefix(String source) {
		String prefix = this.prefix;
		prefix = prefix.toLowerCase();

		StringBuilder builder = new StringBuilder(source);
		if (builder.indexOf(prefix) == 0) {
			builder.delete(0, prefix.length());
		}
		return builder.toString();
	}
}
