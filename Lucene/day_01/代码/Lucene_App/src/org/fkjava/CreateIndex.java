package org.fkjava;

import java.io.IOException;
import java.nio.file.Paths;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

public class CreateIndex {


	public static void main(String[] args) {
		// TODO Auto-generated method stub
        
		
		try {
			//指定索引库的位置
			Directory  directory = FSDirectory.open(Paths.get("G:\\Lucene\\tb_article"));
			
			//指定分词器     StandardAnalyzer:单字分词     文章管理     文   章   管   理  
			Analyzer  analyzer = new StandardAnalyzer();  
			
			//指定索引的分词方式以及索引的创建模块
			IndexWriterConfig config = new IndexWriterConfig(analyzer);
			//设置索引的创建模式
			config.setOpenMode(OpenMode.CREATE_OR_APPEND);
			
			//通过IndexWriter索引库中简历索引   第一个参数：指定索引库的目录  
			IndexWriter write = new IndexWriter(directory, config);
			
			//指定需要存储的数据
			String articleTitle = "文章";  
			String content = "疯狂手机维修培训学校提供苹果,三星,诺基亚等品牌维修培广州疯狂手机维修技术提高培训课程 安卓手机维修培训远程班 疯狂手机维修培训网络基础班 苹果手机维修远程.";
			
			//将文档信息存储在索引库
             //创建Document对象用于封装文章相关信息
			Document document = new Document();
			//document.add(new TextField(articleTitle));
			//第一个参数name:字段名称 第二个参数：字段值   StringField：不会对关键字做分词    Store.YES：存储数据。并可以用于检索，Store.NO：数据不会被存储，但是可以用于实现检索功能
			document.add(new StringField("id","3", Store.YES));
			document.add(new StringField("title",articleTitle, Store.YES));
			document.add(new TextField("content",content, Store.YES));
			
			//将数据写入索引库
			write.addDocument(document);
			//提交数据
			write.commit();
			//关闭流操作
			write.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
