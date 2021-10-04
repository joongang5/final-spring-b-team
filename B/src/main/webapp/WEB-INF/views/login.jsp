<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

function loginValidation(){
	
	var m_id = $("#m_id").val();
	var m_pw = $("#m_pw").val();
	
	if(!m_id){
		alert("아이디를 입력하세요.");
		$("#m_id").focus();
		return false;
	}else if(!m_pw){
		alert("비밀번호를 입력하세요.");
		$("#m_pw").focus();
		return false;
	}else {
		login(m_id,m_pw);
	}
	
}

function login(m_id, m_pw) {
		var idpw = {"m_id" : m_id , "m_pw" : m_pw};

	$.ajax({
		
		url : "login.do",
		type : "post",
		data : idpw,
		success : function(data) {
			if (data == 2) {
				alert("아이디 혹은 비밀번호가 맞지 않습니다.");
				return false;
			} else if (data == 3) {
				location.href = "loginSuccess.do";
				
			}
		},
		error: function(){
			alert("error");
		}

	})
	
	
}
	function enterKeyCheck(){
		
		 if(event.keyCode == 13)
			  {
			 loginValidation();
			  }
			
			
		}
</script>
<body>
<form>
   <h1>로그인</h1>
   
   <input type="text" id ="m_id" name="m_id"   placeholder="ID"  autofocus onkeyup="enterKeyCheck()" >
   <input type="password" id="m_pw"  name="m_pw" placeholder="Password" onkeyup="enterKeyCheck()" >
	<input  type="button" onclick="loginValidation()" value="로그인">
	<input type="button" value="회원가입"  onclick="location.href='join.do'" >
</form>
</body>
</html>