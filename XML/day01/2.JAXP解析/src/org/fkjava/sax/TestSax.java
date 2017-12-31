package org.fkjava.sax;

import java.io.IOException;
import java.io.InputStream;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class TestSax {

	/**
	 * 使用SAX解析note.xml文件,读取内容，打印在控制台
	 * */
	public static void main(String[] args) {
		InputStream is = null;
		try {
			// 1. 使用流读取note.xml
			// 从web开始，读取资源文件很少使用FileInputStream，因为在web项目中没有src路径
			// getResourceAsStream方法可以访问类路径下面的资源文件,返回流
			// "/"表示类路径的根目录,/org/fkjava/sax/a.xml
			is = TestSax.class.getResourceAsStream("/note.xml");
			// 2. 获得SAXParser：SAX解析的类
			SAXParserFactory factory = SAXParserFactory.newInstance();
			SAXParser parser = factory.newSAXParser();
			// 3. 解析xml
			parser.parse(is, new DefaultHandler(){

				@Override
				public void startDocument() throws SAXException {
					System.out.println("解析文档开始");
				}

				@Override
				public void endDocument() throws SAXException {
					System.out.println("解析文档结束");
				}

				// 开始读取元素
				@Override
				public void startElement(String uri, String localName,
						String qName, Attributes attributes)
						throws SAXException {
					System.out.println("读取["+qName+"]元素开始");
				}

				// 结束读取元素
				@Override
				public void endElement(String uri, String localName,
						String qName) throws SAXException {
					System.out.println("读取["+qName+"]元素结束");
				}

				/**
				 *  接收元素中字符数据的通知。 
				 *  ch - 字符。
					start - 字符数组中的开始位置。
					length - 从字符数组中使用的字符数。 
					<name>hello</name>
					[h,e,l,l,o]
				 */
				@Override
				public void characters(char[] ch, int start, int length)
						throws SAXException {
					String content = new String(ch, start, length);
					System.out.println(content);
				}
				
			});
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
