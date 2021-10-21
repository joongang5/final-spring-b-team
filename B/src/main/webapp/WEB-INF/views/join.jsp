<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<link href="./resources/css/header.css" rel="stylesheet"/>

<meta charset="UTF-8">
<title>회원가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

/* 회원가입 유효성 체크 */

function DaumPostcode() { //다음 우편번호 api
    new daum.Postcode({
        oncomplete: function(data) {
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            let addr = ''; // 주소 변수
            let extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 때 추가 (-공동주택일 경우에만 추가하는 건 일단 제외)
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("detailAddress").value = extraAddr;
            
            } else {
                document.getElementById("detailAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
            
            hideValue();
        }
    }).open();
 } 
 
 function hideValue(){
    var postcode = document.getElementById('postcode').value
    var address = document.getElementById('address').value
    var detailAddress = document.getElementById('detailAddress').value
    
    $('input[name=postcode2]').attr('value',postcode)
    $('input[name=address2]').attr('value',address)
    $('input[name=detailAddress2]').attr('value',detailAddress)
 }

function signUpValidation(){
   var m_id = $("#m_id").val();
   var m_pw = $("#m_pw").val();
   var m_pwCheck = $("#passwordCheck").val();
   var m_email = $("#m_email").val();
   
   
   if(!m_id){
      alert("아이디 입력은 필수입니다.");
      $("#m_id").focus();
   }else if(!m_pw){
      alert("비밀번호 입력은 필수입니다.");
      $("#m_pw").focus();
   }else if(!m_pwCheck){
      alert("비밀번호 확인 입력은 필수입니다.");
      $("#passwordCheck").focus();
   }else if(m_pw != m_pwCheck){
      alert("비밀번호가 일치하지 않습니다.");
      $("#m_pwCheck").focus();      
   //}else if(!nickName){
   //   alert("닉네임 입력은 필수입니다.");
   //   $("#nickname").focus();
   }else if(!m_email){
      alert("이메일 입력은 필수입니다.");
      $("#m_email").focus();
   }else {
      signUp();
   }
   
}

function signUp(){
   
   $.ajax({
      
      url : "join.do",
      type:"post",
      data :  $("#registerform").serialize(),
      success:function(data){
         if(data == 0){
            alert("회원가입이 완료됐습니다.^^");
            location.href = "login.do"
         }else if(data == 1){
            $("#idCheck").text("중복된 아이디 입니다.");
            $("#idCheck").css({"color":"red"});
            return false;
            }
      }
      
      
   })
   
}
function domain2(domain){
	var domain = domain.value
	
	$('input[name=domain]').attr("value",domain)
}


</script>
</head>

<body>

<div id="wrapper">
            <a href="./index.do" ><img class="img-logo"  src="./resources/images/Logo.png"/>메인</a> 
      
   <br>
   <div id=h1>
   <br>
   
      <br>
      
       <div id="form8">
       <div class="fieldlabel"><label for="m_addr">*주소</label></div>
         <!--주소 찾기 API 사용-->
         <!--우편번호, 주소1, 주소2-->
         <div class="address payment-delivery__form">
         <button class="small-button" onclick="DaumPostcode()">주소 찾기</button><br>
            <input type="text" id="postcode" name="postcode" placeholder="우편 번호"
               readonly="readonly"><br> <input type="text" id="address" name="address"
               placeholder="주소"> <br><input type="text" id="detailAddress" name="detailAddress"
               placeholder="상세 주소">
               </div>
               
         </div>
      </div>
   <br>
   
         
<form id="registerform">


      
      
      <div id="form1">
      <h1>회원가입</h1><br><br>
           <div class="fieldlabel"><label for="m_id">*아이디</label></div>
           <div class="formfield"><input type="text" id="m_id" name="m_id" maxlength="20" value=""placeholder="아이디를 입력해주세요."></div>
           <span id="idCheck"></span>
           <br>
      </div>
      
        <div id="form2">
        <div class="fieldlabel"><label for="m_name">*이름</label></div>
        <div class="formfield"><input type="text" id="m_name" name="m_name" maxlength="20" value=""placeholder="ex)홍길동"></div><br>
   </div>
   
      <div id="form3">
        <div class="fieldlabel"><label for="m_phone">*핸드폰번호</label></div>
        <div class="formfield"><input type="text" id="m_phone" name="m_phone" maxlength="20" value=""placeholder="ex)010-1234-1234"></div><br>
   </div>
        
        <div id="form4">
        <div class="fieldlabel"><label for="m_pw">*패스워드</label></div>
         <input type="password" id="m_pw" name="m_pw" maxlength="20" autocomplete="off"placeholder="사용하실 비밀번호를 입력하세요."></div><br>
      <div id="form5">
        <div class="fieldlabel"><label for="passwordCheck">패스워드확인</label></div>
      <input type="password" id="passwordCheck" name="passwordCheck" maxlength="20" autocomplete="off"placeholder="비밀번호를 동일하게 입력하세요."></div><br>
       
      <div id="form6">
        <div class="fieldlabel"><label for="m_email">*이메일</label></div>
        <div class="formfield">
        <input type="text" id="m_email" name="email" size="20" maxlength="20" 
             value="" autocomplete="off"placeholder="아이디만입력해주세요."><span>@</span>
            <input type="text" id="domain" list="domains" name="domain" value="" placeholder="ex)gmail.com">
            <select onchange="domain2(this)">
            	<option>도메인을 선택해주세요</option>
            	<option value="gmail.com">gmail.com </option>
            	<option value="naver.com">naver.com</option>
            	<option value="hanmail.net">hanmail.net</option>
            </select>
           
       <div id="form7">
        <input type="hidden" id="postcode2" name="postcode2" placeholder="우편 번호" value=""
               readonly="readonly">
               <input type="hidden" id="address2" name="address2" value=""
               placeholder="주소"> 
                <input type="hidden" id="detailAddress2" name="detailAddress2"
               placeholder="상세 주소" value="">
            
               </div>
               
           <!--    <datalist id="domains">
                <option value="naver.com">
                <option value="daum.net">
                <option value="gmail.com">
                <option value="yahoo.co.kr">-->
         
        </div>
        <br><br>
       <div id="joinbt">
                 <input type="button" class="small-button" onclick="signUpValidation()" value="회원가입">
        </div>   
             </div>
    </form>

 

      <style type="text/css">
      
  *{padding:0;margin:0;box-sizing:border-box;}
  
  #wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: #EDEDED;
  }
  
  #h1{
  display:block;
  
  }
   #registerform{
   display:table;
   width: auto;
   height: auto;
   margin:0 auto;

   }

   .registerform{
  position:absolute;
  width:400px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
   }
  .fieldlabel{ 
   width: 130px;
   height: 35px;
   line-height: 35px;
   margin: 0 10px;
   padding: 0 15px; 
   border: 1px solid rgb(255, 138, 0);
   border-radius: 25px;
   background-color: white;
    }
    input {
    height: 25px;
    line-height: 35px;
    margin: 0 30px;
    padding: 0 35px;
    border: 1px solid rgb(255, 138, 0);
    }
label{
display:block;
text-align:center;
}
.joinbtn{
   width: 110px;
   border: 1px solid rgb(255, 138, 0);
   background-color: white;
   color: rgb(0, 0, 0); 
   border-radius: 25px;
   cursor: pointer;
   text-align: center;
   float: right;
   display:block;
   text-align:center;
}

li{
   list-style:none;
}
.small-button{
 width: 110px;
   border: 1px solid rgb(255, 138, 0);
   background-color: white;
   color: rgb(0, 0, 0); 
   border-radius: 25px;
   cursor: pointer;
   text-align: center;
   display: inline-block;
   display:block;
   text-align:center;
}




}
#joinbt{
 
    position: absolute;
    bottom: 200px;
    left: 30px;
}
#form8{
  display: flex;
  justify-content: center;
  background: #EDEDED;
  
}

    </style>
        
</body>
</html>