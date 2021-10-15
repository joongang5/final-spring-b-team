<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<meta charset="UTF-8">
<title>회원가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">


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
	//var nickName = $("#nickname").val();
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
		alert("비밀번호가 맞지 않습니다.");
		$("#m_pwCheck").focus();		
	//}else if(!nickName){
	//	alert("닉네임 입력은 필수입니다.");
	//	$("#nickname").focus();
	}else if(!m_email){
		alert("이메일 입력은 필수입니다.");
		$("#m_email").focus();
	}else {
		signUp()
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
				alert("이미 존재하는 아이디입니다.");
				return false;
		//	}else if(data == 3){
		//		alert("이미 존재하는 닉네임입니다.");
		//		return false;
			}
		}
		
	})
}

</script>
</head>

<body style="background-color:#f0f5f3">
<h1> 회원 가입</h1>
		<div class="fieldlabel"><label for="m_addr">*주소</label></div>
			<!--주소 찾기 API 사용-->
			<!--우편번호, 주소1, 주소2-->
			<div class="address payment-delivery__form">
				<button class="small-button" onclick="DaumPostcode()">주소 찾기</button>
				<input type="text" id="postcode" name="postcode" placeholder="우편 번호"
					readonly="readonly"> <input type="text" id="address" name="address"
					placeholder="주소"> <input type="text" id="detailAddress" name="detailAddress"
					placeholder="상세 주소">
			</div>
			
<form id="registerform">

		
        <div class="fieldlabel"><label for="m_id">*아이디</label></div>
        <div class="formfield"><input type="text" id="m_id" name="m_id" maxlength="20" value=""></div>
        
        <div class="fieldlabel"><label for="m_name">*이름</label></div>
        <div class="formfield"><input type="text" id="m_name" name="m_name" maxlength="20" value=""></div>
	
        <div class="fieldlabel"><label for="m_phone">*핸드폰번호</label></div>
        <div class="formfield"><input type="text" id="m_phone" name="m_phone" maxlength="20" value=""></div>

       
        <input type="hidden" id="postcode2" name="postcode2" placeholder="우편 번호" value=""
					readonly="readonly"> <input type="hidden" id="address2" name="address2" value=""
					placeholder="주소"> <input type="hidden" id="detailAddress2" name="detailAddress2"
					placeholder="상세 주소" value="">
        
        
        <div class="fieldlabel"><label for="m_pw">*패스워드</label></div>
        <div class="formfield">
<input type="password" id="m_pw" name="m_pw" maxlength="20" autocomplete="off">
</div>

        <div class="fieldlabel"><label for="passwordCheck">패스워드확인</label></div>
        <div class="formfield">
        
<input type="password" id="passwordCheck" name="passwordCheck" maxlength="20" autocomplete="off">
</div>
       
     <!--     <div class="fieldlabel"><label for="nickname">*닉네임</label></div>
     //   <div class="formfield"><input type="text" id="nickname" name="nickname" maxlength="20" value=""></div>
-->
        <div class="fieldlabel"><label for="m_email">*이메일</label></div>
        <div class="formfield">
        <input type="text" id="m_email" name="m_email" size="20" maxlength="20" 
             value="" autocomplete="off"><span>@</span>
            <input id="domain" list="domains" name="domain" placeholder="도메인입력/선택">
            <!--  
            <datalist id="domains">
                <option value="naver.com">
                <option value="daum.net">
                <option value="gmail.com">
                <option value="yahoo.co.kr">-->
            </datalist>
        </div>
       
        <div class="btnfield">
            <input type="button" onclick="signUpValidation()" value="회원가입">
        </div>        
    </form>
    

  		
</body>
</html>