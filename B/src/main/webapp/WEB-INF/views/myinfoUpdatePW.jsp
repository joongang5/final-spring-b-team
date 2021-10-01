<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.js">
</script>
<script type="text/javascript">
$(document).ready(function(){
	//alert("정상 작동확인");
});

function pw1Check(){
	var	pw1 = $("#pw1").val();
	if(pw1 == "" || pw1.length < 5){
		$("#checkResult1").css("color","red");
		$("#checkResult1").text("비밀번호는 최소 다섯 글자 이상이어야 합니다.");
		$("#pw1").focus();
		$("#updateBtn").attr("disabled", true);
		return false;
	}else{
		$("#checkResult1").css("color","blue");
		$("#checkResult1").text("");
		return true;
	}
}

function pw2Check(){
	var	pw1 = $("#pw1").val();
	var pw2 = $("#pw2").val(); 
	if(pw1 != pw2){
		$("#checkResult2").css("color","red");
		$("#checkResult2").text("비밀번호가 일치하지 않습니다.");
		$("#pw1").focus();
		$("#updateBtn").attr("disabled", true);
		return false;
	}else{
		$("#checkResult2").css("color","blue");
		$("#checkResult2").text("");
		$("#updateBtn").attr("disabled", false);
		return true;
	}
}

function submit(){
	alert("비밀번호가 수정되었습니다.");
}

</script>
<title>비밀번호수정</title>
</head>
<body>
	<div id="main">
		<div id="update">
			<h1>비밀번호수정</h1>
			<a href="./myinfo.do">회원정보조회</a> 
			<a href="./myinfoUpdatePW.do">비밀번호수정</a>
			<a href="./myinfoDelete.do">회원탈퇴</a>
			<a href="./cart.do">장바구니</a>
			<hr>
			<form action="./myAccountChangePW.do" method="post" onsubmit="submit()">
				<table>
					<tr>
						<th>새 비밀번호<br> 영문, 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요.
						</th>
						<td><input type="password" name="pw1" id="pw1"
							required="required" onchange="return pw1Check()"><p id="checkResult1"></p></td>
					</tr>
					<tr>
						<th>새 비밀번호 확인</th>
						<td><input type="password" name="pw2" id="pw2"
							required="required" onchange="return pw2Check()"><p id="checkResult2"></p></td>
					</tr>
				</table>
				<button type="submit" id="updateBtn" disabled="disabled">비밀번호 변경</button>
			</form>
			<c:if test="${param.msg eq 'ok'}">
				<script type="text/javascript">
				alert("비밀번호가 변경되었습니다.");
				</script>
			</c:if>
		</div>
	</div>
</body>
</html>