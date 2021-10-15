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
.img-logo



#loginbtn:hover { background-color: #FFCCFF; color: rgb(138, 43, 226); }
#idpwbtn:hover { background-color: #FFCCFF; color: rgb(138, 43, 226); }
#joinbtn:hover { background-color: #FFCCFF; color: rgb(138, 43, 226); }

</style>

<body>
   
   <a href="./index.do" ><img class="img-logo"  src="./resources/images/Logo.png"/>메인</a>
   
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
   <div class="save_id"><input type ="checkbox" id ="save_id"/><label for ="save_id">아이디저장</lavel></div>
 
   <br>
   <br>
   
   <div class="loginbt"> 
   
   <input type="button" onclick="loginValidation()" value="로그인">
   
   </div>
   
  <div class="joinbt"> 
   
<br>

   <input type="button" value="회원가입"  onclick="location.href='join.do'" >
   </div>
   
</form>
</div>
</div>
</div>
<br>
<br>
<br>
<br>
<!-- 네이버아이디로로그인 버튼 노출 영역 
<div id="naverIdLogin"></div>-->
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




</body>
</html>