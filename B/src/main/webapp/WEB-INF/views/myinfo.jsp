<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myinfo</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<h1>회원정보조회</h1>
	<a href="./myinfo.do">회원정보조회</a>
	<a href="./myinfoUpdatePW.do">비밀번호수정</a>
	<a href="./myinfoDelete.do">회원탈퇴</a>
	<a href="./cart.do">장바구니</a>
	<hr>

	<table width="300px">
		<tr>
			<th>아이디</th>
			<td><span>${myinfo.m_id }</span></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><span>${myinfo.m_name }</span></td>
		</tr>
		<tr>
			<form action="./myinfoUpdatePhone.do" method="post">
			<th>휴대전화</th>
			<td><input type="text" name="m_phone" value="${myinfo.m_phone }"></td>
			<td><input type="submit" value="변경"></td>
			</form>
		</tr>
		<tr>
			<form action="./myinfoUpdateEmail.do" method="post">
			<th>이메일</th>
			<td><input type="email" name="m_email" value="${myinfo.m_email}"></td>
			<td><input type="submit" value="변경"></td>
			</form>
		</tr>
		<tr>
			<form action="./myinfoUpdateAddr.do" method="post">
			<th>주소</th>
			<td><input type="text" name="m_addr" value="${myinfo.m_addr }"></td>
			<td><input type="submit" value="변경"></td>
			</form>
		</tr>

	</table>
</body>
</html>