<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript">

function loginValidation(){
	
	var m_id = $("#m_id").val();
	var m_pw = $("#m_pw").val();
	
	if(!m_id){
		alert("아이디를 입력하세요.");
		$("#m_id").focus(); //입력포커스로 이동
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
				alert(m_id + "님 ,환영합니다.")
				location.href = "index.do";
				
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
	<style>
	*{padding:0;margin:0;box-sizing:border-box;}
	body{
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background: linear-gradient(to right, #F2E3D5, #F2E3D5, #FFA335); 
	background-size: cover;
	 }
	 boby::before{
	 content:"";
	 position: absolute; z-index:  1;
	 top: 0; right: 0; bottom: 0; left: 0;
	 background-color: ;
	 }
	 
}
	
	</style>
<section class="login-form">

   <h1>로그인</h1>
   
	<div id="idin"> <!-- 아이디 입력창 -->  
 
       <input type="text" id ="m_id" name="m_id" placeholder="ID" 
		autofocus onkeyup="enterKeyCheck()" >
    </div>
    
    
   	<div id="pwin"> <!-- 비밀번호 입력창 -->
   
   <input type="password" id="m_pw"  name="m_pw" placeholder="Password"
    onkeyup="enterKeyCheck()" >
    
   
   
    <div class="save_id"> <!-- 아이디 기억 -->
     </div><input type ="checkbox" id ="save_id"/>
     <label for ="save_id"> 아이디저장 </lavel></div>
   
   
	<div id="loginbt"> <!-- 로그인 버튼 -->	
	
	<input  type="button" onclick="loginValidation()" value="로그인">

	</div>
	
	<div class="joinbt"> <!-- 회원가입 버튼 -->
	<input type="button"  onclick="location.href='join.do'" value="회원가입" >
	</div>
	

</div>
<br>
<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<div id="naverIdLogin"></div>
<!-- //네이버아이디로로그인 버튼 노출 영역 -->

<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "HZHfCuzMD7Ns_uzbjC6R",
			callbackUrl: "http://localhost:8080/B/naverCallback.do",
			isPopup: false, 
			loginButton: {color: "green", type: 3, height: 40} 
		}
	);
	

	naverLogin.init();
	

window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					sessionStorage.setItem("userInfo",naverLogin.user.id);
					sessionStorage.setItem("userEmail",naverLogin.user.getEmail());
					sessionStorage.setItem("userName",naverLogin.user.getName());
                    

					window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/B/index.do");
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
</script>

<a href="./index.do">메인으로</a>


</body>
</html>