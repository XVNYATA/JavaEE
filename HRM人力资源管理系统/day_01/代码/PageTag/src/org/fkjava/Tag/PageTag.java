package org.fkjava.Tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

//标签处理类 ：用于画分页标签
public class PageTag extends TagSupport {
	//定义分页标签相关参数
	private  int pageIndex = 1;//当前页码
	private  int pageSize;//每页显示的记录
	private  int recordCount;//总记录数
	private String submitUrl;//提交地址index.action?pageIndex = {0}
	private String pageStyle = "digg";//分页样式
	private final static String TAG = "{0}";
	
    private  int tatalPageNum;//总页码
	@Override
	public int doStartTag() throws JspException {
		// TODO Auto-generated method stub
        
		//根据分页标签中的参数画出分页标签
		JspWriter out = this.pageContext.getOut();
		StringBuffer sbf = new StringBuffer();
		
		StringBuffer page = new StringBuffer();
		try {
			//总记录大于零
			if(this.recordCount>0){
				//定义请求地址
			     String requestUrl = "";
				//计算总页码      100  10       
				tatalPageNum =  recordCount % pageSize ==0 ? recordCount / pageSize  : (recordCount / pageSize) +1;

				//如果当前页码在第一页
				if(this.pageIndex ==1 ){
					page.append("<span class='disabled'>上一页</span>");
					
					//计算中间页码
					calcMiddlePage(page);
					
					
					//判断下一页是否可以点击    如果当前页码等于总页码  ，说明总共就一页
					if(this.pageIndex == this.tatalPageNum){
						page.append("<span class='disabled'>下一页</span>");
					}else{
						//submitUrl:index.action?pageIndex = {0}
						requestUrl = submitUrl.replace(TAG, String.valueOf(this.pageIndex + 1));
						page.append("<a href='"+requestUrl+"'>下一页</a>");
					}
					
		
				//当前页码等于尾页
				}else if(this.pageIndex == tatalPageNum){
					requestUrl = submitUrl.replace(TAG, String.valueOf(this.pageIndex - 1));
					page.append("<a href='"+requestUrl+"'>上一页</a>");
					
					//计算中间页码
					calcMiddlePage(page);
					
					page.append("<span class='disabled'>下一页</span>");

				}else{
					//当前页码在中间
					requestUrl = submitUrl.replace(TAG, String.valueOf(this.pageIndex - 1));
					page.append("<a href='"+requestUrl+"'>上一页</a>");
					
					//计算中间页码
					calcMiddlePage(page);
					
					requestUrl = submitUrl.replace(TAG, String.valueOf(this.pageIndex + 1));
					page.append("<a href='"+requestUrl+"'>下一页</a>");
				}
				//计算开始以及结束行号
				int startSize = (this.pageIndex - 1) * this.pageSize + 1;
				// 总记录：99   每页显示：10   最后一页  9
				int endSize = this.pageIndex == this.tatalPageNum ? this.recordCount : this.pageIndex * this.pageSize;
				sbf.append("<table  width='100%' class='"+this.pageStyle+"' style='font-size:14px'><tr><td align='center'>"+page.toString()+"<input type='text' size='2' id='jump_num'/><input type='button' value='跳转' id='but_jump'/></td></tr>");
				sbf.append("<tr><td align='center'>总共<font color='red'>"+this.recordCount+"</font>条记录,当前显示"+startSize+"-"+endSize+"条记录</td></tr></table>");

				
				sbf.append("<script type='text/javascript'>");
				
				sbf.append("document.getElementById('but_jump').onclick = function(){");
				sbf.append("var value = document.getElementById('jump_num').value;");
				sbf.append("if(!/^[1-9]\\d*$/.test(value)||value > "+this.getTatalPageNum()+"){");
				sbf.append("alert('请输入[1-"+this.getTatalPageNum()+"]之间的页码值！');");
				sbf.append("}else{");
				sbf.append("var submiturl = '"+this.submitUrl+"';");
				sbf.append("submiturl = submiturl.replace('"+TAG+"',value);");
				sbf.append("window.location = submiturl;");
				
				sbf.append("}");
				
				sbf.append("}");
				sbf.append("</script>");
			}else{
				//总记录为零
				sbf.append("<table  width='100%' style='font-size:14px'><tr><td align='center'>总共<font color='red'>0</font>条记录,当前显示0-0条记录</td></tr></table>");
				
			}
			out.write(sbf.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
        //跳过开始标签与结束标签中的信息
		return SKIP_BODY;
	}


	//计算中间页码
	private void calcMiddlePage(StringBuffer page) {
		// TODO Auto-generated method stub
		//如果总页码小于等于10  则全部显示  1 2 3 4 5 6 7 8 9 10
		//定义跳转地址
		String requestUrl = "";
		if(this.tatalPageNum <=10){
			for(int i=1;i<this.tatalPageNum;i++){
				
				//判断i是否等于当前页码
				if(i == this.pageIndex){
					page.append("<span class='current'>"+i+"</span>");
				}else{
					requestUrl = this.submitUrl.replace(TAG, String.valueOf(i));
					page.append("<a href='"+requestUrl+"'>"+i+"</a>");
				}
			}
	
	    //如果总页码数大于10页  则需要拼 ... 当前页码靠近首页时  1 2 3 4 5 6 7 8 9 ... 100   
		}else if(this.pageIndex <= 8){
			for(int i=1;i<=9;i++){
				//判断i是否等于当前页码
				if(i == this.pageIndex){
					page.append("<span class='current'>"+i+"</span>");
				}else{
					requestUrl = this.submitUrl.replace(TAG, String.valueOf(i));
					page.append("<a href='"+requestUrl+"'>"+i+"</a>");
				}
				
			}
			page.append("...");
			
			//拼装尾页
			requestUrl = this.submitUrl.replace(TAG, String.valueOf(this.tatalPageNum));
			page.append("<a href='"+requestUrl+"'>"+this.tatalPageNum+"</a>");
			
			//如果总页码数大于10页  则需要拼 ... 当前页码靠近尾页时  1 ... 91 92 93 94 95 96 97 98 99 100 
		}else if(this.pageIndex + 8>=this.tatalPageNum){
			requestUrl = this.submitUrl.replace(TAG, String.valueOf(1));
			page.append("<a href='"+requestUrl+"'>"+1+"</a>");
			page.append("...");
			
			for(int i=this.tatalPageNum - 9;i <=this.tatalPageNum;i++){
				//判断i是否等于当前页码
				if(i == this.pageIndex){
					page.append("<span class='current'>"+i+"</span>");
				}else{
					requestUrl = this.submitUrl.replace(TAG, String.valueOf(i));
					page.append("<a href='"+requestUrl+"'>"+i+"</a>");
				}
			}

			//如果总页码数大于10页  则需要拼 ... 当前页码靠近中间时  1 ... 40 41 42 43 44 45 46 47 48 ... 100
		}else{
			requestUrl = this.submitUrl.replace(TAG, String.valueOf(1));
			page.append("<a href='"+requestUrl+"'>"+1+"</a>");
			page.append("...");
			
			for(int i=this.pageIndex - 4;i <=this.pageIndex + 4;i++){
				//判断i是否等于当前页码
				if(i == this.pageIndex){
					page.append("<span class='current'>"+i+"</span>");
				}else{
					requestUrl = this.submitUrl.replace(TAG, String.valueOf(i));
					page.append("<a href='"+requestUrl+"'>"+i+"</a>");
				}
			}
			
			page.append("...");
			//拼装尾页
			requestUrl = this.submitUrl.replace(TAG, String.valueOf(this.tatalPageNum));
			page.append("<a href='"+requestUrl+"'>"+this.tatalPageNum+"</a>");
			
		}
		
		
	}


	public int getPageIndex() {
	
		return pageIndex;
	}


	public void setPageIndex(int pageIndex) {
		System.out.println("pageIndex:"+pageIndex);
		if(pageIndex == 0){
			pageIndex = 1;
		}
		this.pageIndex = pageIndex;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getRecordCount() {
		return recordCount;
	}


	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}


	public String getSubmitUrl() {
		return submitUrl;
	}


	public void setSubmitUrl(String submitUrl) {
		System.out.println("submitUrl:"+submitUrl);
		this.submitUrl = submitUrl;
	}


	public int getTatalPageNum() {
		return tatalPageNum;
	}


	public void setTatalPageNum(int tatalPageNum) {
		this.tatalPageNum = tatalPageNum;
	}


	public String getPageStyle() {
		return pageStyle;
	}


	public void setPageStyle(String pageStyle) {
		this.pageStyle = pageStyle;
	}

   


}
