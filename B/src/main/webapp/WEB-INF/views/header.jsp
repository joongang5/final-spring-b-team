<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(function(){
	//헤더 네비게이션
	$(".son").hide();
	$("#parent li").on("mouseover focusin",function(){
		$(this).children(".son").stop().show();
	}).on("mouseout focusout",function(){
		$(this).children(".son").stop().hide();
	});
	
	$("#logOut").click(function(){
		if(!confirm("로그아웃 하시겠습니까?")){
			return false;
		}
	});
});
</script>
<header>
	<div id="nameLine2" class="header">
		<div id="nameLine" class="header">
			<c:if test="${sessionScope.m_id eq null}">
				<a href="" title="로그인">로그인해주세요.</a>				
			</c:if>
			<c:if test="${sessionScope.m_id ne null}">			
				<a id="logOut" href="" title="로그아웃">${sessionScope.m_name}님, 안녕하세요.</a><br>
				<a href="" title="마이페이지">마이페이지</a>			
			</c:if>
		</div>
	</div>
	<div id="logoLine" class="header">
		<h1><a href="./index.do" title="Spring.B"><img alt="Spring.B" src="./resources/images/Logo2.png"></a></h1>
		<p class="center"><input type="text" placeholder="검색"></p>
		<p class="right"></p>
	</div>
	<nav class="header">
		<ul id="parent">
			<c:forEach items="${categoryMain }" var="cm">					
				<li class="navMain">
					<a href="./categoryPage.do?category=${cm.c_main }" title="${cm.c_main }" class="navMain">${cm.c_main }</a>
					<ul class="son">
						<c:forEach items="${category }" var="c">
							<c:if test="${cm.c_main eq c.c_main}">
								<li class="navSon"><a href="./categoryPage.do?category=${cm.c_main }&&sub=${c.c_sub }" title="${cm.c_main } &gt; ${c.c_sub}" class="navSon">${c.c_sub}</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
			</c:forEach>
			<li class="navMain">
				<a href="./categoryPage.do" title="전체보기" class="navMain">전체보기</a>
			</li>
		</ul>
	</nav>
</header>