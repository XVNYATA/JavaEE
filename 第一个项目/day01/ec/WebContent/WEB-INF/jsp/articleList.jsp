<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fktaglib" uri="http://www.fkjava.org/j1303/fktaglib"%>
<div id="tabs" style="Width: 750px; background-color: white;">
	<ul>
		<li><a href="tabs-1">${fn:replace(articleType.name, '-', '') }</a></li>
	</ul>
	<div class="sales-queue" id="tabs-1"
		style="background-color: white; margin-top: -25px;">
		<ul class="goods-queue3">
			<c:forEach items="${articleList}" var="article">
				<li id="selbgc11">
					<dl class="item-des">
						<dt>
							<a href="${pageContext.request.contextPath }/item?id=${article.id}" title="${article.title }">
								<img src="${pageContext.request.contextPath }/images/article/${article.image}"
									width="132" height="96" />
							</a>
						</dt>
						<dd>
						${article.price}<strong><fmt:formatNumber value="${article.discountPrice}" pattern="#,#00.0#"/></strong>
						</dd>
						<dd>
							<h2>
								<a href="${pageContext.request.contextPath }/item?id=${article.id}" title="${article.title }">${article.title }</a>
							</h2>
						</dd>
					</dl>
				</li>
			</c:forEach>
		</ul>
		<div class="pagebottom" id="pager" style="clear:both;">
			<fktaglib:pager formId="articleForm" maxRows="10"/>
		</div>
	</div>
</div>