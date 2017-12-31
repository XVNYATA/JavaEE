package org.fkjava.test;

import java.io.IOException;
import java.io.InputStream;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import org.fkjava.bean.Note;

public class TestNote {

	/**
	 * 使用JAXB解析note.xml
	 * */
	public static void main(String[] args) {
		InputStream is = null;
		try {
			// 创建一个JAXBContext对象，表示需要将Note对象和xml进行转换
			JAXBContext jc = JAXBContext.newInstance(Note.class);
			// 创建解码器
			Unmarshaller u = jc.createUnmarshaller();
			// 将note.xml和Note对象进行转换
			is = TestNote.class.getResourceAsStream("/note.xml");
			Object obj = u.unmarshal(is);
			// 强转
			Note note = (Note)obj;
			System.out.println(note);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
