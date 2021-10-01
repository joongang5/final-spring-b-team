<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myinfo</title>
<script type="text/javascript">

function myAccountDelete(){
	if(confirm("정말 탈퇴하시겠습니까?")){
		alert("계정 탈퇴 되었습니다.");
		return true;
	}else{
		alert("취소되었습니다.");
		return false;
	}
}

function move(){
	location.href='./main.do';
}
</script>
</head>
<body>
	<h1>회원탈퇴</h1>
	<a href="./myinfo.do">회원정보조회</a>
	<a href="./myinfoUpdatePW.do">비밀번호수정</a>
	<a href="./myinfoDelete.do">회원탈퇴</a>
	<a href="./cart.do">장바구니</a>
	<hr>
	<h3>탈퇴 시 모든 회원정보가 삭제되며, 이는 복구할 수 없습니다.<br>
	계속 진행하시겠습니까?</h3>
	<form action="./myAccountDelete.do" method="post" >
	<button onclick="return myAccountDelete()">탈퇴하기</button>
	</form>
	<%-- <button onclick="myAccountDelete('${myinfo.m_id }')">회원탈퇴</button>
	<button onclick="location.href='./main.do'">게시판으로</button> --%>
</body>
</html>