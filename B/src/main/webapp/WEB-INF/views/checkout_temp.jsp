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
<form action="checkout.do" method="post">
	<input type="hidden" id="m_no" name="m_id" value="yunji">
	<c:forEach var="i" begin="1" end="5">
		<input type="hidden" id="p_no" name="p_no$cnt" value="${i},${i+1}">
	</c:forEach>
	<button type="submit">결제하기</button> 
</form>
</body>
</html>