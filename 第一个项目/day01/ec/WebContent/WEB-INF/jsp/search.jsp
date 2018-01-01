<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	商品类型： 
	<select name="typeCode" id="typeCode">
		<c:forEach items="${secondArticleTypeList }" var="type">
			<option value="${type.code }" <c:if test="${page.searchConditions.typeCode eq type.code }">selected="selected"</c:if>>
				${type.name }
			</option>
		</c:forEach>
	</select>
	<input name="keyword" type="text" size="50" value="${page.searchConditions.keyword }" />
	<input type="submit" value="搜索"/>
</div>