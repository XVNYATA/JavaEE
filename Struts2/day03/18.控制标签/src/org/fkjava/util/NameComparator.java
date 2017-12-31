package org.fkjava.util;

import java.util.Comparator;

public class NameComparator implements Comparator<Object> {

	// 如果返回值大于0，表明o1>02,
	// 如果返回值＝0,表明o1==02,
	// 如果返回值 <0,表明o1<02,
	@Override
	public int compare(Object o1, Object o2)
	{
		return o1.toString().length() > o2.toString().length()
				? 1 : o1.toString().length() < o2.toString().length() ?
			    - 1 : 0;
	}

}
