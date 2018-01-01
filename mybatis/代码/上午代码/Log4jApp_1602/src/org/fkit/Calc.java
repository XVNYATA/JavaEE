package org.fkit;

import org.apache.log4j.Logger;

public class Calc {

	//获取日志处理类
	private Logger logger  =Logger.getLogger(Calc.class);
	public int chu(int a,int b) {
		// TODO Auto-generated method stub
		logger.debug("a:"+a);
		logger.debug("b:"+b);
		try {
			int c = a/b;
			logger.debug("c:"+c);
			return c;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error(e);
		}
		return 0;
		
	}

	

}
