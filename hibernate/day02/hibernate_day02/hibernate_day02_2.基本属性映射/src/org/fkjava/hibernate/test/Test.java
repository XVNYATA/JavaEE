package org.fkjava.hibernate.test;

import java.math.BigDecimal;

public class Test {
	public static void main(String[] args) {
		double a = 0.0001 ;
		double b = 0.0005 ;
		double c = a+b ;
		System.out.println(c);
		
		BigDecimal a1 = BigDecimal.valueOf(a);
		BigDecimal b1 = BigDecimal.valueOf(b);
		BigDecimal c1 = a1.add(b1);
		System.out.println(c1.doubleValue());
	}
}
