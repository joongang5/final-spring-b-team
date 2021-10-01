<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
	<h1>main이 실행됩니다.</h1>
	<c:choose>
		<c:when test="${sessionScope.m_name ne null}">
			<h2>${sessionScope.m_name }님 반갑습니다.
			<a href="./message.do">쪽지</a></h2>
			<a href="./myinfo.do">마이페이지</a>
			<a href="./logout.do">로그아웃</a>
		</c:when>
		<c:otherwise>
			<a href="./login.do">로그인 해주세요.</a>
		</c:otherwise>
	</c:choose>
</body>
</html>