<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
------------------------------------------------------------------------------------<br>
	**********카카오페이 데모버전************** 	
	<form method="post" action="kakaoPay.do">
	  <button><img src = "./resources/images/pay.png" onclick=></button>
	</form>
------------------------------------------------------------------------------------	
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>글쓴이</th>
		</tr>
		<c:forEach items="${list	}" var="l">
			<tr>
				<td>${l.sb_nno	}</td>
				<td>${l.sb_title	}</td>
				<td>${l.sb_date	}</td>
				<td>${l.sb_count	}</td>
				<td>${l.sm_name	}(${l.sm_id	})</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>