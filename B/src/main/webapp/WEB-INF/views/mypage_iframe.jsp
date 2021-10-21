<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 | Spring.B</title>
<link href="./resources/css/header.css" rel="stylesheet"/>
<link href="./resources/css/reset.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
body {
	overflow: hidden;
}

#headerSpace {
	height: 124px;
}

#iframe-content {
	text-align: center;
 	margin: auto;
	margin-top: 1px;
    min-height: 813px;
    position: relative;
}

#iframe-content object,
#iframe-content embed {
    margin: 0;
    padding: 0;  
    width: 100%; 
    position: absolute; 
    top: 0; 
    left: 0; 
}

#footerSpace {
	height: 202px;
	position: absolute; 
}
</style>
</head>
<body>
<c:if test="${sessionScope.m_id eq null }">
	<c:redirect url="login.do" />
</c:if>
<div id="headerSpace"> 
<c:import url="/header.do"/>
</div>
<div id="iframe-content">
	<object data="./
		<c:choose>
			<c:when test="${to == 'orderhistory'}">
			orderhistory1.do
			</c:when>
			<c:otherwise>
			myinfo.do
			</c:otherwise>
		</c:choose>
		" width="1920px" height="813px">
	    <embed src="./
			<c:choose>
			<c:when test="${to == 'orderhistory'}">
			orderhistory1.do
			</c:when>
			<c:otherwise>
			myinfo.do
			</c:otherwise>
		</c:choose>" width="1920px" height="813px"> </embed>
	    Error: 마이페이지를 정상적으로 불러오지 못했습니다.
	</object>
</div>
<footer id="footerSpace">
</footer>
</body>
</html>