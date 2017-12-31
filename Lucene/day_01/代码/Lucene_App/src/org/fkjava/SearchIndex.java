package org.fkjava;

import java.nio.file.Paths;

import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

public class SearchIndex {


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			//指定索引的存放位置
			Directory  directory = FSDirectory.open(Paths.get("G:/Lucene/tb_article"));
			//指定查询对象，需要指定索引库目录信息
			IndexReader reader = DirectoryReader.open(directory);
			
			//创建检索对象，用于实现全文检索
			IndexSearcher search = new IndexSearcher(reader);	
			//创建query对象，根据关键字进行检索    new Term：不会对关键子进行分词
			Query query = new TermQuery(new Term("title", "文章"));
			
			//开始检索  第一个参数：检索对象    第二个参数：检所出的记录数量
			TopDocs  topDocs  = search.search(query, 10);  
			
			//获取所有的记录
			ScoreDoc[] scoreDocs =  topDocs.scoreDocs;
			if(scoreDocs!=null){
				for(ScoreDoc scoreDoc : scoreDocs){
					
					System.out.println("文档的id："+scoreDoc.doc);
					System.out.println("文档的得分："+scoreDoc.score);
					int docId = scoreDoc.doc;
					//根据文档的id获取文档
					Document doc = search.doc(docId);
					String id = doc.get("id");
					//获取文档的标题
					String title  = doc.get("title");
					String content = doc.get("content");
					System.out.println("id:"+id+" title："+title+" content :"+content);
				    
				}
			}
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		

	}

}
