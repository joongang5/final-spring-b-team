<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-Version 1.2.0.js"></script>
<script type="text/javascript">

function select(idpw){
	var idpw = idpw.value
	if(idpw == "id"){
		jQuery('#findPw').hide();
		jQuery('#findId').show();
} if(idpw == "pw"){
	jQuery('#findPw').show(); 
	jQuery('#findId').hide(); 
		
}if(method == "nn"){
	jQuery('#findId').hide(); 
	jQuery('#findPw').hide();
}
}

function fwith(method){
	var method = method.value
	
if(method == "email"){
	jQuery('#valid').hide(); 
	jQuery('#withEmail').show(); 	
}if(method == "n"){
	jQuery('#valid').hide();
}
}

function sendEmail(){
	var m_name = $('#m_name').val()
	var m_email = $('#m_email').val()

$.ajax({
			url : "findIdwithEmail.do",
			type : "post",
			data : {"m_name" : m_name, "m_email" : m_email},
			success : function(data) {
				alert("입력하신 메일로 인증 번호를 보냈사오니, 확인 하신 후 다음 란에 입력하여 주세요.")
				jQuery('#valid').show();
			},

		})
	
	 
}

function sendEmail2(){
	var m_name = $('#m_name1').val()
	var m_id = $('#m_id1').val()
	var m_email = $('#m_email1').val()

$.ajax({
			url : "findIdwithEmailPW.do",
			type : "post",
			data : {"m_name" : m_name, "m_email" : m_email, "m_id" : m_id},
			success : function(data) {
				alert("입력하신 메일로 인증 번호를 보냈사오니, 확인 하신 후 다음 란에 입력하여 주세요.")
				jQuery('#valid2').show();
			},

		})
	
	 
}


function validKey(){
	var inputByUser = $('#valid1').val()
	var m_name = $('#m_name').val()
	var m_email = $('#m_email').val()
$.ajax({
			url : "validKey.do",
			type : "post",
			data : {"userKey" : inputByUser,"m_name" : m_name, "m_email" : m_email},
			success : function(data) {
				if(data != "1"){
					
					 $('input[name=userKey]').attr("value", "당신의 아이디는 "  + data + " 입니다.")
					 $('input[name=userKey]').attr("type","text");
					 
				}else{
					 $('input[name=userKey]').attr("type","hidden");
				     alert("인증번호가 틀립니다.")
				}
			},

		})
	
}


function validKey2(){
	var inputByUser = $("#valid3").val()
	var m_name = $('#m_name1').val()
	var m_id = $('#m_id1').val()
	var m_email = $('#m_email1').val()
	
	$.ajax({
			url : "validKey2.do",
			type : "post",
			data : {"userKey1" : inputByUser,"m_name1" : m_name, "m_email1" : m_email, "m_id1": m_id},
			success : function(data) {
				if(data != "1"){
					$('input[name=idd]').attr("value", data)
					jQuery('#modiPW').show();
					 
				}else{
					 $('input[name=userKey2]').attr("type","hidden");
				     alert("인증번호가 틀립니다.")
				}
				
			},

		})
	
	
	
}

function modiPW(){
	var newpw = $('#newPW').val();
	var newpw2 = $('#newPW2').val();
	var id = $('#idd').val();
	
	$.ajax({
		url : "modiPW.do",
		type : "post",
		data : {"newpw" : newpw, "newpw2" : newpw2 , "idd" : id},
		success : function(data) {
			if(data == 0){
			alert("비밀번호가 변경되었습니다.")
			location.href="./login.do"
			}else{
				alert("입력하신 두 개의 값이 서로 다릅니다.")
			}
		},
		
	

	})
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
   font-size: 20px;
    }

   



</style>
<body>

<div style="width: 50%; height: 75%; border: dashed 2px #403429;border-radius:15px;" > <br>
<h1>아이디 / 비밀번호 찾기</h1><br>
<div><a href="./index.do">메인으로 가기</a> &nbsp; <a href="./login.do" >로그인하러 가기</a></div> <br>
<div style="margin-left : 5%;width:90%;height: 70%; border: solid 2px #403429;border-radius:15px;"><br>
<select onchange="select(this)" style="width: 65%; height: 35px;">
	<option value="nn">찾는 것을 선택해주세요.</option>
	<option value="id">아이디 찾기</option>
	<option value="pw">비밀번호 찾기</option>
</select><br>
<br>
<div id="findId" style="display:none;" >
<p style=" margin-right: 60%;">*이름<br></p>
<input type="text" name="m_name" id="m_name" placeholder="ex)홍길동" style="width: 65%; height: 35px;"> <br>
<br><select onchange="fwith(this)"style="width: 65%; height: 35px;">
	<option value="n">인증 수단을 선택해주세요</option>
	<option value="email">이메일로 본인 인증하기</option>	
</select>
<br>

<div id="withEmail" style="display:none"><br>
<p style=" margin-right: 30%;">*회원 가입 당시 이메일</p>
<input type="text" name="m_email" id="m_email" placeholder="ex)0000@0000" style="width: 65%; height: 35px;"> <br>
<button onclick="sendEmail()" style="width: 20%; height: 35px;margin-top:10px;background-color:#FF8A00;">인증번호 보내기</button><br>
</div>

<div id="valid" style="display:none;">
<input name="valid1" id="valid1" type="text" placeholder="인증번호를 입력하세요"style="width: 65%; height: 35px;margin-top:5px;margin-left:20px;"> 
<br> <button onclick="validKey()"style="width: 20%; height: 35px;background-color:#FF8A00;margin-top:5px;">확인</button>
</div>

<input name="userKey" id="userKey" type="hidden" style="width:200px;;hegiht:100px;border:none;" value="">

</div>


<div id="findPw" style="display:none;" >
<p style=" margin-right: 60%;">*이름<br></p>
<input type="text" name="m_name1" id="m_name1" placeholder="ex)홍길동" style="width: 65%; height: 35px;"> <br>
<p style=" margin-right: 60%;">*아이디<br></p>
<input type="text" name="m_id1" id="m_id1" style="width: 65%; height: 35px;">  <br>
 <p style=" margin-right: 38%;">*회원 가입 당시 이메일</p>
<input type="text" name="m_email1" id="m_email1" placeholder="ex)0000@0000" style="width: 65%; height: 35px;"><br>
 <button onclick="sendEmail2()"style="width: 20%; height: 35px;margin-top:10px;background-color:#FF8A00;">인증번호 보내기</button>  <br>	
</div>

<div id="valid2" style="display:none;">
<input name="valid3" id="valid3" type="text" placeholder="인증번호를 입력하세요" style="width: 45%; height: 35px;margin-left:20px;margin-top:5px;">  <button onclick="validKey2()" style="width: 20%; height: 35px;background-color:#FF8A00;">확인</button>
</div>

<div id="modiPW" style="display:none;" >
<input type="hidden" name="idd" id="idd" value="" style="width: 65%; height: 35px;">
<p style=" margin-right: 30%;">*새로운 비밀 번호</p>
<input  id="newPW" type="password"  style="width: 65%; height: 35px;"> <br>
<p style=" margin-right: 30%;">*비밀번호 확인</p>
<input  id="newPW2"  type="password" style="width: 45%; height: 35px;" >  <button onclick="modiPW()"style="width: 20%; height: 35px;background-color:#FF8A00;">확인</button>
</div>

</div>

</div>
</body>
</html>