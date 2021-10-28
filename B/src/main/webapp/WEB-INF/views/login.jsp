<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
            alert(m_id + "님 ,환영합니다.")
            location.href = "index.do";
            
         }
      },
      error: function(){
         alert("아이디나 비밀번호가 잘못 되었습니다.");
      }

   })
   
   
}
   function enterKeyCheck(){
      
       if(event.keyCode == 13)
           {
          loginValidation();
           }
         
         
      }

   
   
   $(document).ready(function() {
		var id = getCookie("id"); //저장된 쿠키를 가져오는데 없으면 공백이 들어간다고 하는데 이상한 localhost뭐시껭이 들어감
		$("input[name='m_id']").val(id);
		
		if ($("input[name='m_id']").val() != "") {
			$("#saveId").attr("checked", true);
		}
		$("#saveId").change(function() {   //체크박스 변화 있으면 아이디 저장 누르면 3일동안 보관
			if ($("#saveId").is(":checked")) {
				var id = $("input[name='m_id']").val();
				setCookie("id", id, 3);
			} else {
				deleteCookie("id");
			}
		});
		$("input[name='m_id']").keyup(function() { //체크박스 선택 한담 아이디 넣어도 3일동안 보관 
			if ($("#saveId").is(":checked")) {
				var id = $("input[name='m_id']").val();
				setCookie("id", id, 3);
			}
		});
	});

   
   function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}
	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}   
	
	
</script>
<style type="text/css">

*{padding:0;margin:0;box-sizing:border-box;}
   body{
   display: flex;
   justify-content: center;
   align-items: center;
   height: 100vh;
   background: #EDEDED; 
   background-size: cover;
   text-align: center;
    }

    


.idin input { /* 아이디 입력인풋 */
   width: 250px;
   height: 35px;
   line-height: 35px;
   margin: 0 10px;
   padding: 0 15px;
   border: 1px solid rgb(255, 138, 0);
   border-radius: 25px;
   position:relative;
   background-color: white;
}

.pwin input { /* 비밀번호 입력인풋 */
   width: 250px;
   height: 35px;
   line-height: 35px;
   margin: 0 10px;
   padding: 0 15px;
   border: 1px solid rgb(255, 138, 0);
   border-radius: 25px;
   position:relative;
   background-color: white;
}

.btbox { /* 버튼 박스 */
   margin: 0 auto;
   width: 250px;
   padding: 0;
   text-align: center;
}

.loginbt input { /* 로그인 버튼 */
   width: 250px;
   border: 1px solid rgb(255, 138, 0);
   background-color: white;
   color: rgb(0, 0, 0);
   padding: 5px;
   border-radius: 25px;
   cursor: pointer;
   text-align: center;
}
.joinbt input { /* 회원가입 버튼 */
   width: 110px;
   border: 1px solid rgb(255, 138, 0);
   background-color: white;
   color: rgb(0, 0, 0); 
   padding: 5px;
   border-radius: 25px;
   cursor: pointer;
   text-align: center;
   float: right;
}

.findIdPW input { /* 아이디 비번 찾기 버튼 */
   width: 150px;
   border: 1px solid rgb(255, 138, 0);
   background-color: white;
   color: rgb(0, 0, 0); 
   padding: 5px;
   border-radius: 25px;
   cursor: pointer;
   text-align: center;
   
}

.img-logo



#loginbtn:hover { background-color: #FFCCFF; color: rgb(138, 43, 226); }
#idpwbtn:hover { background-color: #FFCCFF; color: rgb(138, 43, 226); }
#joinbtn:hover { background-color: #FFCCFF; color: rgb(138, 43, 226); }

</style>

<body>
<c:if test="${sessionScope.m_id ne null }">
	<c:redirect url="index.do" />
</c:if>   
   <a href="./index.do" ><img class="img-logo"  src="./resources/images/Logo.png"/><!--  메인--></a>
   
<div class="loginbox">
<form action="./login" method="post">
   <h1>LOG IN</h1>
   
   <div class="idin">
   <input type="text" id ="m_id" name="m_id"   placeholder="아이디를 입력하세요."  required="required" >
   </div>
   <br>
      <div class="pwin">
   <input type="password" id="m_pw"  name="m_pw" placeholder="비밀번호를 입력하세요" required="required" >
  </div>
   
   <br>
   <input type="checkbox" id="saveId"> 아이디 기억하기
   <br>
   
   <div class="loginbt"> 
   
   <input type="button" onclick="loginValidation()" value="로그인">
   
   </div>
   
  <div class="joinbt"> 
   
<br>
   <input type="button" value="회원가입"  onclick="location.href='join.do'" >
   </div>
   <div class="findIdPW">
   <input type="button" value="아이디/비밀번호 찾기"  onclick="location.href='findID.do'" >
   </div>
  
   
</form>
</div>
</div>
</div>
<br>
<br>
<br>
<br>



</body>
</html>