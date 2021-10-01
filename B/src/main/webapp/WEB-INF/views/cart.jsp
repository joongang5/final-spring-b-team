<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<h1>장바구니</h1>
	<a href="./myinfo.do">회원정보조회</a>
	<a href="./myinfoUpdatePW.do">비밀번호수정</a>
	<a href="./myinfoDelete.do">회원탈퇴</a>
	<a href="./cart.do">장바구니</a>
	<a href="./logout.do">로그아웃</a>
	<hr>
	<table>
		<tr>
			<th>상품명</th>
			<th>수량</th>
			<th>가격</th>
		</tr>
		<c:forEach items="${cart }" var="c">
		<tr>
			<td>${c.p_title}</td>
			<td>${c.cnt}</td>
			<td>${c.p_price}</td>
		</tr>
	</c:forEach>
	</table>

</body>
</html>