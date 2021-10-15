<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지 제작용 임시</title>
</head>
<body>
<c:if test="${sessionScope.m_id eq null }">
	<c:redirect url="login.do" />
</c:if>
<form action="checkout.do" method="post">
	<c:forEach var="i" begin="48" end="49">
		<input type="hidden" id="p_no" name="p_no$cnt" value="${i}$${i-46}">
	</c:forEach>
	<button type="submit">결제하기</button> 
</form>
</body>
</html>