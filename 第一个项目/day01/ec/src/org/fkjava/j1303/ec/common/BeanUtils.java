package org.fkjava.j1303.ec.common;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class BeanUtils {

	public static <T> T binding(Class<T> type, HttpServletRequest request)
			throws InstantiationException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		T obj = type.newInstance();
		// 获取类中的所有方法
		Method[] methods = type.getMethods();
		Map<String, String[]> map = request.getParameterMap();
		for (Map.Entry<String, String[]> entry : map.entrySet()) {
			// name
			String name = entry.getKey();
			String[] values = entry.getValue();
			String first = name.substring(0, 1).toUpperCase();
			// setName
			String setter = "set" + first + name.substring(1);
			for (Method method : methods) {
				if (method.getName().equals(setter)) {
					// 如果方法名和拼接字符串方法名相同，表示需要调用此方法
					// 根据方法的参数类型，转换数据类型
					Class[] types = method.getParameterTypes();
					if (types.length == 1) {
						// 有效的setter方法
						Object value = null;
						Class parameterType = types[0];
						if (parameterType == int.class
								|| parameterType == Integer.class) {
							// 是int类型
							value = Integer.parseInt(values[0]);
						} else {
							// 还有各种数据类型...
						}
						method.invoke(obj, value);
					} else {
						// 多个参数是无效的setter方法
					}
				}
			}
		}
		return null;
	}
}
