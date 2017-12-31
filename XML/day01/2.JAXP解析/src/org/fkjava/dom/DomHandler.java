package org.fkjava.dom;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;


import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 * 了解，不要写代码
 * */
public class DomHandler {

	public static void main(String[] args) throws Exception {
		
		// XML文档所有数据已经读到内存
//		InputStream is = new FileInputStream("src/note.xml");
		InputStream is = DomHandler.class.getResourceAsStream("/note.xml");

		// 定义工厂 API，使应用程序能够从 XML 文档获取生成 DOM 对象树的解析器。
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

		// 获取此类的实例之后，将可以从各种输入源解析 XML
		DocumentBuilder builder = factory.newDocumentBuilder();

		// Document 接口表示整个 HTML 或 XML 文档。从概念上讲，它是文档树的根，并提供对文档数据的基本访问。
		// saxParser.parse(is, new MyDefaultHandler());
		Document document = builder.parse(is);

		// 获取根节点(元素)
		Element root = document.getDocumentElement();
		System.out.println(root.getNodeName());

		// 读取note节点 NodeList 接口提供对节点的有序集合的抽象
		NodeList nodeList = root.getChildNodes();

		for (int i = 0; i < nodeList.getLength(); i++) {
			// 获取一个节点 Node 接口是整个文档对象模型的主要数据类型。它表示该文档树中的单个节点
			Node childNode = nodeList.item(i);

			// 因为这个api将<也看成node
			if (childNode instanceof Element) {
				NamedNodeMap attributes = childNode.getAttributes();
				for (int j = 0; j < attributes.getLength(); j++) {
					Node attribute = attributes.item(j);
					System.out.println(attribute.getNodeName() + ": "
							+ attribute.getNodeValue());
				}
				// childNode.getFirstChild() 跳过<
				System.out.println(childNode.getNodeName() + ": "
						+ childNode.getFirstChild().getNodeValue());
			}

		}
	}

}
