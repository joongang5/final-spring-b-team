<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="./resources/js/inParentWindow.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<link rel="stylesheet" href="./resources/css/mypage.css">
<link rel="stylesheet" href="./resources/css/invoice.css">
<link rel="stylesheet" href="./resources/css/reset.css">
<title>교환폼</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
window.addEventListener('DOMContentLoaded', saveLocation("AskExchange.do"+location.search));

function whyExchange(reason){
	var e_reason = reason.value
	if(e_reason == 1){
		 $('input[name=e_reason]').attr("value",e_reason);
		 jQuery('#onlyZero').hide(); 
		 jQuery('#onlyOne').show(); 
		 
		 
	}if(e_reason == 0){
		$('input[name=e_reason]').attr("value",e_reason);
		 jQuery('#onlyOne').hide(); 
		 jQuery('#onlyZero').show(); 
	}if(e_reason == 2){
		 jQuery('#onlyOne').hide();
		 jQuery('#onlyZero').hide(); 
	}
}

function exchangeService(){
	var o_no = $('#o_no1').val() 
	var p_no1 = $('#p_no1').val()
	var pa_id1 = $('#pa_id1').val()  
	var e_reason = $('#e_reason').val()
	
	 $.ajax({
			url : "exchanging2.do",
			type : "post",
			data : {"o_no" : o_no,"pa_id1" : pa_id1,"p_no1" : p_no1,"e_reason" : e_reason},
			success : function(data) {
				alert("접수가 완료되었습니다")
				location.href="./orderhistory1.do"
			},

		})
}


function iamport(){

		IMP.init('imp52922696');//가맹점 식별코드
		IMP.request_pay({
		    pg : $("input:radio[name=payplan]:checked").val(),
		    pay_method : 'card',
		    merchant_uid : new Date().getTime(),
		    name : "소비자책임사유왕복택배비",
		    amount : 5000,
		    buyer_email : "email",
		    buyer_name : "이현아",
		    buyer_tel : "01039109345",
		    buyer_addr : "성남시"+ ' ' + "안알려줌",
		    buyer_postcode : "13160"
	}, function (rsp) {
		  if(rsp.success){
			var o_no = $('#o_no1').val()  
			var pa_id = $('#pa_id').val()  
			var p_no = $('#p_no').val()  
			var p_title = $('#p_title').val()
			var e_reason = $('#e_reason').val()
			
			registerExchange(o_no,pa_id,p_no,p_title,e_reason);
			alert("접수가 완료되었습니다.")  
		  }else{
			  alert("결제 실패")
			  }
		  });
		  
       
}

function registerExchange(o_no,pa_id,p_no,p_title,e_reason){
	 $.ajax({
			url : "registerExchange.do",
			type : "post",
			data : {"o_no" : o_no,"pa_id" : pa_id,"p_no" : p_no,"p_title" : p_title,"e_reason" : e_reason},
			success : function(data) {
				location.href="./orderhistory1.do"
			},

		})
}
	   


</script>
<body>

<!--myPage 공통 부분-->
	<div id="layout-container">
		<header id="header-space"></header>
		<div id="myPage-main-container">
			<nav id="myPage-sideMenu">
				<div class="sideMenu__block-container">
					<div class="sideMenu__block">
						<h3>나의 쇼핑 활동</h3>
						<ul class="sideMenu__items">
							<li class="sideMenu__item sideMenu__item--active"><a
								href="./orderhistory.do">구매 내역 조회</a></li>
							<li class="sideMenu__item"><a href="./mypage_recent.do">최근 본 상품</a></li>
							<li class="sideMenu__item"><a href="./mypage_point.do">적립금 조회</a></li>
						</ul>
					</div>
					<div class="sideMenu__block">
						<h3>회원 정보</h3>
						<ul class="sideMenu__items">
							<li class="sideMenu__item"><a href="./myinfo.do">회원 정보
									조회</a></li>
							<li class="sideMenu__item"><a href="./myinfoUpdatePW.do">비밀번호
									변경</a></li>
							<li class="sideMenu__item"><a
								href="./myinfoDelete.do">회원 탈퇴</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<main>
				<div class="myPage-title">
					<h1></h1>
				</div>
				<!--myPage 공통 부분 끝-->



<div  style="margin-top: 10%;">
<h1>교환 신청하기</h1>
<p> 🔺 교환 사유가 '단순 변심' 일 경우, 왕복배송비용 5,000원을 고객님께서 부담하셔야 합니다</p>
<p> 🔺 교환 접수가 완료되면 자동으로 택배사에 회수 접수가 됩니다. </p>
 <div>
 - 교환 사유
 <select onchange="whyExchange(this)">
	<option value="2">교환하시는 이유를 선택해주세요</option>
	<option value="0">불량</option>
	<option value="1">단순변심</option>
</select>

 <input type="hidden" id="e_reason" name="e_reason" value="" readonly="readonly">
 
</div>

<br>
<div id="onlyZero" style="display:none;">

<h2>교환 상품 내역</h2>

<label>주문 번호</label>
<input name="pa_id1" id="pa_id1" value="${getInfo.pa_id}" readonly="readonly">
<label>상품명</label>
<input name="p_title1" id="p_title1"  value="${getInfo.p_title}" style="width:300px;"readonly="readonly">
<input type="hidden" name="p_no1" id="p_no1" value="${getInfo.p_no}" readonly="readonly">
<input type="hidden" id="o_no1" value="${o_no}">
<button onclick="exchangeService()" style="height: 37px; width: 150px;border-radius: 8px;font-size: 11pt;background-color:#ff8a00;"> 교환 접수하기 </button>


</div>
<br>
<div id="onlyOne" style="display:none;">

<h2>교환 상품 내역</h2><br>

<label>주문 번호</label><br>
<input name="pa_id" id="pa_id" value="${getInfo.pa_id}" readonly="readonly">
<label>상품명</label><br>
<input name="p_title" id="p_title"  value="${getInfo.p_title}" style="width:300px;"readonly="readonly">
<input type="hidden" name="p_no" id="p_no" value="${getInfo.p_no}" readonly="readonly"> 


<h2 style="margin-top:10px;"> 왕복 배송 비용 5000원을 결제 </h2><br>
 <h2>결제 수단</h2><br>
  <label class="payment-plan-button">
  <input type="radio" id="kakao" name="payplan" value="kakaopay" class="payment-plan-button">
  <span><img src="resources/images/kakaopay.png">카카오 페이</span>
  </label>
  <label class="payment-plan-button">
  <input type="radio" id="payco" name="payplan" value="payco" class="payment-plan-button">
  <span><img src="resources/images/payco.png">페이코</span>
  </label>
  <label class="payment-plan-button">
  <input type="radio" id="inicis" name="payplan" value="html5_inicis" class="payment-plan-button">
  <span><img src="resources/images/inicis.png">KG이니시스</span>
  </label>
  <input type="hidden" id="o_no1" value="${o_no }">
  <br>
 <button onclick="iamport()" style="margin-top:10px; height: 37px; width: 150px;border-radius: 8px;font-size: 11pt;background-color:#ff8a00;">5000원 결제하기</button>
</div>
</div>
</body>
</html>