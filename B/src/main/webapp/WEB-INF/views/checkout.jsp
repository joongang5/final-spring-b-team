<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>주문/결제 | Spring.B</title>
<meta charset="UTF-8">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>

	function DaumPostcode() {
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
	        }
	    }).open();
 	} 
 	
	function openTerms(termsNo) {
		document.getElementById(termsNo).style.display = "block";
	 }
	 
	 function closeTerms(termsNo) {
		document.getElementById(termsNo).style.display = "none";
	 }
		 
	function getProductArr() {
		let array_p_no$cnt= [];
		
		<c:set var="totalAmount" value="0"/>
		<c:forEach var="list" items="${orderProductList}">
		array_p_no$cnt.push('${list.p_no}'+'$'+'${list.cnt}');
		<c:set var="totalAmount" value="${totalAmount + list.amount}"/>
		</c:forEach>
		
		return array_p_no$cnt;
	}
	
	function getProductTitles() {
		let productTitles = '';
		
		<c:forEach var="list" items="${orderProductList}">
		productTitles += '${list.p_title}' + ', ';
		</c:forEach>
		
		productTitles = productTitles.substr(0, productTitles.length - 2);
		
		return productTitles;
	}
	
	function getDateNo() {
		let today = new Date();
		let dateNo = '';
		dateNo += today.getFullYear();
		dateNo += today.getMonth()+1; 
		dateNo += today.getDate();
		dateNo += today.getHours(); 
		dateNo += today.getMinutes();
		dateNo += today.getSeconds();
		dateNo += today.getMilliseconds();
		return dateNo;
	 }
	
	function getDate() {
		let today = new Date();
		let date = '';
		date += today.getFullYear() + '년 ';
		date += today.getMonth()+1  + '월 '; 
		date += today.getDate()  + '일 ';
		date += today.getHours() + '시 '; 
		date += today.getMinutes() + '분';
		return date;
	 }
	
	let finalTotalAmount = ${totalAmount};
	let finalWillPoint = Math.round(finalTotalAmount * 0.05);
	finalWillPoint = Math.floor(finalWillPoint / 10) * 10;
	let usePoint = 0;
	
	//적립금 처음부터 10원 단위로 절사하기 위한 처리
	window.addEventListener('DOMContentLoaded', (willPointEvent) => {
		document.getElementById("willPoint").innerHTML = finalWillPoint.toLocaleString('ko-KR');
	});
	
	 function reflectPoint(totalAmount, usablePoint, maxPoint=0) {
		usePoint = document.getElementById("usePoint").value;
		
		if (usePoint == '') {
			usePoint = 0;
		}
		if (usePoint % 10 != 0) {
			alert("적립금은 10원 단위로만 사용 가능합니다.");
			usePoint = Math.floor(usePoint / 10) * 10;
			document.getElementById("usePoint").value = usePoint;
		}
		if (usePoint > usablePoint) {
			alert("사용 가능 적립금을 초과했습니다.");
			usePoint = usablePoint;
			document.getElementById("usePoint").value = usablePoint;
		}
		if (maxPoint != 0) {
			usePoint = maxPoint;
			document.getElementById("usePoint").value = maxPoint;
		}
		if (totalAmount < usePoint) {
			usePoint = Math.floor(totalAmount / 10) * 10; //적립금은 10원 단위로만 사용 가능하므로 결제금액이 10 단위가 아닐 때를 위한 처리
			document.getElementById("usePoint").value = usePoint;
		}
		
		finalTotalAmount = totalAmount - usePoint;
		finalWillPoint = Math.round(finalTotalAmount * 0.05);
		finalWillPoint = Math.floor(finalWillPoint / 10) * 10;
		
		document.getElementById("reflectedPoint").innerHTML = usePoint;
		document.getElementById("totalAmount").innerHTML = finalTotalAmount.toLocaleString('ko-KR');
		document.getElementById("checkout").innerHTML = finalTotalAmount.toLocaleString('ko-KR') + "원 결제하기";
		document.getElementById("willPoint").innerHTML = finalWillPoint.toLocaleString('ko-KR');
	 }
	 
	function checkForCheckout() {
		 if(!document.getElementsByName('payplan')[0].checked
				 && !document.getElementsByName('payplan')[1].checked
				 && !document.getElementsByName('payplan')[2].checked) {
			 alert("결제 수단을 선택해주세요.");
			 return false;
		 } else if(!document.getElementById("agreeToTerms").checked) {
			 alert("개인정보 수집 이용 및 제 3자 제공에 동의하셔야 결제를 진행하실 수 있습니다.");
			 return false;
		 }else if(document.getElementById("receiver").value == "") {
			 alert("수령인을 입력하세요.");
			 document.getElementById("receiver").focus();
			 return false;
		 }else if(document.getElementById("tel").value == "") {
			 alert("연락처를 입력하세요.");
			 document.getElementById("tel").focus();
			 return false;
		 }else if(document.getElementById("postcode").value == "") {
			 alert("배송지를 입력하세요.");
			 document.getElementById("address").focus();
			 return false;
		 }else{
			 let productArr = getProductArr();
			 checkStock(productArr);
		 }
	 }
	
	function checkStock(productArr){
		document.getElementById("loading").style.display = "block";
		$.ajax({
			url : 'checkStock.do',
        	type: 'POST',
       		dataType: 'text',
       		contentType : 'application/json; charset=UTF-8',
       		data: JSON.stringify({
       			productList : productArr
       		})
		}).then(
		    function (data) {
		    	console.log("재고 체크 종료");
		    	if(data * 1) {
		    		iamport();
		    	} else {
		    		alert("구매하시려는 상품의 재고가 부족합니다. 상품을 다시 담아주세요.");
			    	document.getElementById("loading").style.display = "none";
		    	}
		    },
		    function () {
		    	alert("상품 재고 확인 중에 문제가 발생했습니다.");
		    	document.getElementById("loading").style.display = "none";
		});
	}
	
	function iamport(){
		IMP.init('imp52922696');//가맹점 식별코드
		IMP.request_pay({
		    pg : $("input:radio[name=payplan]:checked").val(),
		    pay_method : 'card',
		    merchant_uid : getDateNo(),
		    name : getProductTitles(),
		    amount : finalTotalAmount,
		    buyer_email : $("#email").val(),
		    buyer_name : $("#receiver").val(),
		    buyer_tel : $("#tel").val(),
		    buyer_addr : $("#address").val() + ' ' + $("#detailAddress").val(),
		    buyer_postcode : $("#postcode").val()
		}, function (rsp) {
			if ( rsp.success ) {
			console.log(rsp);
			// 결제 위변조 검증
			$.ajax({
	        	url : 'verifyPayment/' + rsp.imp_uid + '.do',
	        	type: 'POST',
           		dataType: 'json',
           		data: {
       	    		imp_uid : rsp.imp_uid
           		}
	        }).then(
	        		function(data) {
		        	console.log(data);
		        	if(rsp.paid_amount == data.response.amount){
			        	console.log("결제 및 결제 검증 완료");
			        	let productArr = getProductArr();
			        	let date = getDate();
			        	saveOrder(rsp.merchant_uid, 
			        			data.response.amount, 
			        			data.response.pgProvider, 
			        			date, 
			        			productArr, 
			        			usePoint, 
			        			finalWillPoint, 
			        			rsp.buyer_name, 
			        			rsp.buyer_addr, 
			        			rsp.buyer_postcode);
		        	} else {
		        		console.log("결제 검증 실패");
		        		let productArr = getProductArr();
			        	let date = getDate();
		        		saveOrder(rsp.merchant_uid, 
			        			rsp.paid_amount, 
			        			rsp.pg_provider, 
			        			date, 
			        			productArr, 
			        			usePoint, 
			        			finalWillPoint, 
			        			rsp.buyer_name, 
			        			rsp.buyer_addr, 
			        			rsp.buyer_postcode,
			        			"결제 위변조 검증을 통과하지 못했숩니다.");
		        	}
		        });
			} else {
		        let errorMsg = rsp.error_msg;
		        let productArr = getProductArr();
	        	let date = getDate();
		        saveOrder(rsp.merchant_uid, 
	        			rsp.paid_amount, 
	        			rsp.pg_provider, 
	        			date, 
	        			productArr, 
	        			usePoint, 
	        			finalWillPoint, 
	        			rsp.buyer_name, 
	        			rsp.buyer_addr, 
	        			rsp.buyer_postcode,
	        			errorMsg);
		    }
        });
    }
	
	function saveOrder(//주문번호, 결제금액, 결제수단, 결제일시, 구매상품 배열, 사용 적립금, 적립 적립금, 수령인, 수령지, 연락처, 에러메세지
			pa_id, pa_amount, pa_plan, pa_date, productArr, usePoint, finalWillPoint, buyer_name, buyer_addr, buyer_postcode, errorMsg=null) {
			$.ajax({
				url : 'checkoutResult.do',
	        	type: 'POST',
           		dataType: 'html',
           		contentType : 'application/json; charset=UTF-8',
           		data: JSON.stringify({
           			pa_id : pa_id,
           			pa_amount : pa_amount,
           			pa_plan : pa_plan,
           			pa_date : pa_date,
           			productList : productArr,
           			usePoint : usePoint,
           			finalWillPoint : finalWillPoint,
           			buyer_name : buyer_name,
           			buyer_addr : buyer_addr,
           			buyer_postcode : buyer_postcode,
           			errorMsg : errorMsg
           		})
			}).then(
			    function (data) {
			    	$("body").empty();
			    	$("body").append(data);
			    	$("html").scrollTop(0);
			    	$("html > head > title").text($("#title").val());
			    });
			
			//참고: 수령지 바꿀 수 있게 되면 order_list 테이블에 칼럼 추가해야 한다.
		}
		
</script>
<link href="./resources/css/header.css" rel="stylesheet"/>
<link href="./resources/css/footer.css" rel="stylesheet"/>
<link rel="stylesheet" href="./resources/css/base.css">
<link rel="stylesheet" href="./resources/css/order-sheet.css">
<style>
header *, footer * {padding: 0;margin: 0;list-style: none;}
header a, footer a{color:black;text-decoration:none;transition:0.3s all;}
header a:link, header a:visited, footer a:link, footer a:visited {color:black;}
header a:hover, header a:focus, footer a:hover, footer a:focus{text-decoration:underline;}
header a:after, footer a:after{height:0;}
	
    .payment-product-content{
      padding-bottom: 10px;
    }
    
    .payment-product-left-block{
      height: 120px;
    }

    .product-content__productThumbnail{
      width: 120px;
      height: 120px;
    }

    .product-content__option-container{
      height: 35%;
    }
    
    .option-content__price-container{
      display: flex;
    }

    .option-content__price{
      font-weight: 600;
    }


    label{
    /* display: grid; */
    }

    label p{
      margin-left: 30px;
    }

    .terms-confirm-container .checkMark {
      height: 14px;
      width: 14px;
      top: 2px;
    }

    .terms-confirm-container label .checkMark:after {
      left: 6px;
      top: 1px;
      width: 4px;
      height: 11px;
    }

    .payment-sum-subject h3{
      margin-top: 0px;
    }

    .payment-will-point-container{
      display: flex;
      justify-content: flex-end;
      font-size: 11pt;
      align-items: center;
    }

    .will-point__value .amount__value{
      font-weight: 600;
    }

    .will-point__section {
      margin-left: 7px;
    }


    .payment-terms-container{
      margin-top: 15px;
      background: #e5e5e5;
      padding: 20px;
    }

    .terms-confirm-container{
      /* display: flex; */
      /* align-items: center; */
      padding-bottom: 10px;
    }

    .terms-content-top__subject{
      font-size: 11pt;
      font-weight: 500;
    }

    .terms-content-top__itemBox{
      display: flex;
      font-size: 11pt;
      position: relative;
      justify-content: space-between;
      width: 96%;
    }

    .terms-content-top__itemBox::before{
      content: '';
      width: 3px;
      height: 3px;
      position: absolute;
      background: #403429;
      top: 10px;
      left: 5px;
    }

    .terms-content-top__topic{
      margin-left: 15px;
    }

    .terms-content-top__view{
      position: relative;
    }

    .terms-content-top__view::after{
      content: '';
      position: absolute;
      width: 6px;
      height: 6px;
      background: transparent;
      /* border: 2px solid; */
      border-bottom: 2px solid #FF8A00;
      border-right: 2px solid #FF8A00;
      transform: rotate(-45deg);
      top: 8px;
      -moz-transform: rotate(45deg);
    }

	 /*로딩 팝업*/
	 #loading {
	  display: none;
	 }
	 
    .loading__background{
      position: fixed;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background: rgba(0,0,0,0.5);
      z-index: 99;
    }

    .loading__popup{
      margin: 10% 35%;
      width: 500px;
      height: 375px;
      position: absolute;
      background: #fbfcf4;
      box-shadow: 0px 0px 13px 9px rgba(0,0,0,0.14);
    }
    
    /*여기서부터 약관 팝업*/
    .first-terms{
      display: none;
    }


    .second-terms{
      display: none;
    }


    .terms-detail__background {
      position: fixed;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background: rgba(0,0,0,0.5);
      z-index: 99;
    }

    .terms-detail__popup{
      /* height: 100%; */
      margin: 8% 25%;
      width: 555px;
      height: 470px;
      position: absolute;
      overflow: auto;
      /* left: 200px; */
      /* top: 25%; */
      background: white;
      padding: 30px;
      box-shadow: 0px 0px 13px 9px rgba(0,0,0,0.14);
      animation-fill-mode: forwards;
      animation-duration: 0.6s;
      animation-timing-function: ease-in-out;
      animation-name: appear-popup;
    }
    @keyframes appear-popup {
      from {
        margin-top: 4%;
      }
      to {
        margin-top: 8%;
      }
    }


    .terms-detail__container{
      margin: auto;
      text-align: center;
    }

    .terms-detail__topic{
      font-size: larger;
      font-weight: 600;
      padding: 20px 0;
    }

    .terms-detail__content{
      padding: 30px;
      border: 1px solid #e5e5e5;
      text-align: left;
    }

	.termsTable{
      border: 1px solid #403429;
      border-collapse: collapse;
      margin: 15px 0;
 }
	
	.termsTable th{
      background: #eeded5;
      height: 45px;
      text-align: center;
      border: 1px solid #403429;
 }
	
	.termsTable th:first-child{
	width: 30%;
	}
	
	.termsTable th:nth-child(2){
	width: 30%;
	/* text-align: center; */
	}
	
	.termsTable th:nth-child(3){
	}
	
	.termsTable td{
	padding: 10px;
	border: 1px solid #403429;
	}
	
	.terms-detail-confirm{
      margin-top: 20px;
	}
	
    .terms-detail-confirm button{
      width: 90px;
      height: 45px;
      border-radius: 12px;
      font-size: large;
    }
    /*약관 팝업 끝*/


    .terms-content-bottom{
      margin-top: 15px;
      font-size: 11pt;
      font-weight: 500;
    }

    
    .payment-section-header{
      margin-top: 45px;
      border-bottom: 1px solid #403429;
    }

    .payment-section-header h2{
      margin-bottom: 5px;
    }

    .payment-section-body {
      margin: 20px 0 20px 10px;
    }

	.payment-product__body{
	  margin: 0;
	}


    .payment-delivery{
      margin-bottom: 60px;
    }


    .payment-delivery__item{
      display: flex;
      align-items: center;
      /* margin-bottom: 5px; */
      width: 95%;
    }

    .long-item{
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      margin-top: 10px;
      margin-bottom: 10px;
    }

    .payment-delivery__section{
      width: 130px;
      /* font-weight: 600; */
      /* margin-right: 10px; */
      font-size: 13pt;
    }

    .payment-delivery__form{
      margin-top: 5px;
      width: 100%;
    }

    .receiver input[type="text"]{
      width: 25%;
    }

    .tel input[type="tel"]{
      width: 50%;
    }

    .address button{
    width: 110px;
    height: 37px;
    /* border-radius: 8px; */
    font-size: 12pt;
    }

    .address input[type="text"]{
      display: block;
      width: 100%;
      margin-bottom: 5px;
    }

    .address input[type="text"]:nth-child(2){
      width: 12%;
      display: inline-block;
      margin-left: 10px;
      margin-right: 10px;
    }

    .memo p{
     display: block;
    }

    .memo input[type="text"]{
      width: 100%;
    }

    .option-content__quantity{
      margin-left: 33px;
      position: relative;
    }

    .number__value{
      font-family: math;
      margin-right: 5px;
    }

    .option-content__price{
      
    }

    .option-content__quantity ::before{
      content: '';
      position: absolute;
      background: #e5e5e5;
      left: -50%;
      top: 1px;
      height: 21px;
      width: 2px;
    }

    .payment-point__body{
      display: flex;
    }

    .payment-point__use label{
      margin-right: 20px;
    }


    .payment-point__use input[type="text"]{
      /* border: 1px solid #403429; */
      width: 100px;
      /* border-radius: 0px; */
      height: 20px;
      font-family: math;
      /* background: transparent; */
      /* border-bottom: 2px solid #403429; */
    }

    .payment-point__use button{
      height: 36px;
      width: 95px;
      /* border-radius: 9px; */
      font-size: 11pt;
    }

    .payment-point__usable{
      display: flex;
      margin-left: 30px;
      align-items: center;
      font-size: 12pt;
    }

    .payment-point__usable-value .amount__value{
      margin-left: 10px;
      color: #ff8a00;
      font-weight: 600;
    }

    .payment-planList{
      display: flex;
    }

    .payment-plan-button input[type="radio"]{
      display:none;
    }

    .payment-plan-button img{
      height: 80%;
    }

    .payment-plan-button input[type="radio"] + span{
      color: #403429;
      display: grid;
      background:none;
      border: 1px solid #e5e5e5;
      padding:0px 10px;
      text-align:center;
      height: 80px;
      width: 100px;
      font-weight:500;
      cursor:pointer;
      justify-items: center;
      align-content: center;
      align-items: center;
    }

    .payment-plan-button input[type="radio"]:checked + span{
      border:2px solid #403429;
      background: #eeded5;
      color: #403429;
      font-weight:800;
    }
    
    .invalidRequest {
      height: 400px;
      margin-bottom: 100px;
      /* text-align: center; */
      padding: 25px 0;
    }

</style>
</head>
<body>
<c:if test="${sessionScope.m_id eq null }">
	<c:redirect url="login.do" />
</c:if>
	<!--약관 보기 누르면 출력되는 div-->
	<!--실제 약관 내용을 포함한다-->
	<div id="firstTerms" class="first-terms terms-detail__background">
	  <div class="terms-detail__popup">
	    <div class="terms-detail__container">
	      <div class="terms-detail__topic">
	        개인정보 수집 및 이용
	      </div>
	      <div class="terms-detail__content-container">
	        <div class="terms-detail__content">
	        Spring.B는 원활한 서비스제공을 위해 최소한의 범위내에서 아래와 같이 개인정보를 수집, 이용합니다.
	          <table class="termsTable">
                    <thead>
                    <tr>
                        <th scope="col">수집 항목</th>
                        <th scope="col">이용 목적</th>
                        <th scope="col">보유 기간</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td scope="row">
                        주문자 정보 (이름, 연락처, 이메일)
                        </td>
                        <td scope="row" rowspan="2">
                        주문상품의 결제, 배송 및 서비스 제공을 위한 사용자 정보 확인
                        </td>
                        <td scope="row" rowspan="2">
                        회원탈퇴 및 목적달성 후 지체없이 삭제합니다. 단, 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령의 규정에 따라 거래 관계 확인을 위해 개인정보를 일정기간 보유 할 수 있습니다. 또한 부정이용 방지를 위하여 회원 탈퇴 후에도 구매 인증 시 입력한 정보는 6개월 동안 보관합니다.
                        </td>
                    </tr>
                    <tr>
                    	<td scope="row">
                        배송 정보 (성명, 주소, 휴대전화)
                        </td>
                    </tr>
                    </tbody>
                </table>
                개인정보 제공에 동의하지 않으실 수 있으며, 동의하지 않으실 경우 서비스 이용이 제한될 수 있습니다.
				<br>그 밖의 사항은 Spring.B 개인정보처리방침에 따릅니다.
	        </div>
	      </div>
	      <div class="terms-detail-confirm">
	        <button onclick="closeTerms('firstTerms');">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!--약관 popup 끝-->
	<!--약관 보기 누르면 출력되는 div-->
	<!--실제 약관 내용을 포함한다-->
	<div id="secondTerms" class="second-terms terms-detail__background">
	  <div class="terms-detail__popup">
	    <div class="terms-detail__container">
	      <div class="terms-detail__topic">
	        수집한 개인정보의 위탁
	      </div>
	      <div class="terms-detail__content-container">
	        <div class="terms-detail__content">
	        Spring.B는 고객서비스 관리 및 민원사항에 대한 등 원활한 업무 수행을 위하여 아래와 같이 개인정보 처리 업무를 위탁하여 운영하고 있습니다.
			<br>또한 위탁계약 시 개인정보보호의 안전을 기하기 위하여 개인정보보호 관련 법규의 준수, 개인정보에 관한 제3자 공급 금지, 사고시의 책임부담 등을 명확히 규정하고 있습니다.
			<br>동 업체가 변경될 경우, 변경된 업체 명을 공지사항 내지 개인정보처리방침 화면을 통해 고지하겠습니다.
	            <table class="termsTable">
                    <thead>
                    <tr>
                        <th scope="col">수탁 업체</th>
                        <th scope="col">위탁 업무 내용</th>
                    </tr>
                    </thead>
                    <tbody>
                     <tr>
                        <td scope="row">
                        (주)아임포트
                        </td>
                        <td scope="row">
                        결제 관리 시스템 제공
                        </td>
                    </tr>
                    <tr>
                        <td scope="row">
                        CJ대한통운(주)
                        </td>
                        <td scope="row">
                        주문상품 배송 업무
                        </td>
                    </tr>
                    <tr>
                        <td scope="row">
                        (주)카카오페이
                        </td>
                        <td scope="row">
                        간편결제
                        </td>
                    </tr>
                     <tr>
                        <td scope="row">
                        엔에이치엔페이코(주)
                        </td>
                        <td scope="row">
                        간편결제
                        </td>
                    </tr>
                     <tr>
                        <td scope="row">
                        (주)케이지이니시스
                        </td>
                        <td scope="row">
                        카드 결제·계좌 이체
                        </td>
                    </tr>
                    </tbody>
                </table>
                개인정보 제공에 동의하지 않으실 수 있으며, 동의하지 않으실 경우 서비스 이용이 제한될 수 있습니다.
				<br>그 밖의 사항은 Spring.B 개인정보처리방침에 따릅니다.
	        </div>
	      </div>
	      <div class="terms-detail-confirm">
	        <button onclick="closeTerms('secondTerms');">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!--약관 popup 끝-->
	<!--로딩용 div-->
	<div id="loading" class="loading__background">
	  <div class="loading__popup">
	    <img src="./resources/images/loading.gif">
	   </div>
	</div>
	  <div id="header-space">
	  <c:import url="/header.do"/>
	  </div>
	<div id="layout-container">
	<c:choose>
		<c:when test="${fn:length(orderProductList) > 0}">
	  <div id="payment-main-container">
	    <main>
	      <div class="payment-title">
	        <h1>주문 / 결제</h1>
	      </div>
	      <div class="payment-detail-container">
	        <div class="payment-delivery">
	          <div class="payment-section-header payment-delivery__header">
	            <h2>배송지</h2>
	          </div>
	          <div class="payment-section-body payment-delivery__body">
	            <div class="receiver payment-delivery__item">
	              <div class="receiver payment-delivery__section">
	                받는 사람
	              </div>
	              <div class="receiver payment-delivery__form">
	                <input type="text" id="receiver" name="m_name" value="${m_name}" readonly="readonly">
	              </div>
	            </div>
	            <div class="tel payment-delivery__item">
	              <div class="tel payment-delivery__section">
	                연락처
	              </div>
	              <div class="tel payment-delivery__form">
	                <input type="tel" id="tel" name="m_phone" value="${m_phone}" readonly="readonly" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/>
	              	<input type="hidden" id="email" name="m_email" value="${m_email}">
	              </div>
	            </div>
	            <div class="address long-item payment-delivery__item">
	              <div class="address payment-delivery__section">
	                주소
	              </div>
	                <!--주소 찾기 API 사용-->
	                <!--우편번호, 주소1, 주소2-->
	              <div class="address payment-delivery__form">
	                <button class="small-button" onclick="DaumPostcode()">주소 찾기</button>
	                <input type="text" id="postcode" placeholder="우편 번호" readonly="readonly" value="${m_addr1}">
	                <input type="text" id="address" placeholder="주소" readonly="readonly" value="${m_addr2}">
	                <input type="text" id="detailAddress" placeholder="상세 주소" readonly="readonly" value="${m_addr3}">
	              </div>
	            </div>
	            <div class="memo long-item payment-delivery__item">
	              <div class="address payment-delivery__section">
	                배송시 요청사항
	              </div>
	                <div class="memo payment-delivery__form">
	                  <input type="text">
	                </div>
	            </div>
	          </div>
	        </div>
	        <div class="payment-product">
	          <div class="payment-section-header payment-product__header">
	            <h2>주문 상품</h2>
	          </div>
	          <div class="payment-section-body payment-product__body">
	          
	            <!--구매할 상품 출력 / 반복문 사용-->
	            <c:forEach var="list" items="${orderProductList}">
		            <div class="payment-product-content">
		              <div class="payment-product-left-block">
		                <div class="product-content__productThumbnail">
		                  <!-- <img src="./resources/images/no-image.png"> -->
		                  <img src="https://blogger.googleusercontent.com/img/a/${list.p_img}">
		                </div>
		              </div>
		              <div class="payment-product-right-block">
		                <div class="product-content__name productName">
		                  ${list.p_title}
		                </div>
		                <div class="product-content__option-container">
		                    <div class="option-content__name">
		                      옵션
		                    </div>
		                    <div class="option-content__price-container">
		                      <div class="option-content__price">
		                        <span class="amount__value"><fmt:formatNumber value="${list.p_price}" pattern="#,###"/></span>원
		                      </div>
		                      <div class="option-content__quantity">
		                        <span class="number__value">${list.cnt}</span>개
		                      </div>
		                    </div>
		                </div>
		              </div>
		            </div>
		         </c:forEach>
	            <!--구매할 상품 출력 끝-->
	          </div>
	        </div>
	        <div class="payment-coupon">
	          <div class="payment-section-header payment-coupon__header">
	            <h2>쿠폰</h2>
	          </div>
	          <div class="payment-section-body payment-coupon__body">
	            <!--쿠폰 시스템 도입시 쿠폰 목록 출력 / 반복문 사용-->
	            해당 서비스는 준비 중입니다.
	          </div>
	        </div>
	        <div class="payment-point">
	          <div class="payment-section-header payment-point__header">
	            <h2>적립금 사용</h2>
	          </div>
	          <div class="payment-section-body payment-point__body">
	            <div class="payment-point__use">
	              <label>
	              <input type="text" id="usePoint" onblur="reflectPoint(${totalAmount},${m_point});" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
	              원
	              </label>
	              <button class="small-button" onclick="reflectPoint(${totalAmount},${m_point},${m_point});">전액 사용</button>
	            </div>
	            <div class="payment-point__usable">
	              <div class="payment-point__usable-section">
	                사용 가능 적립금
	              </div>
	              <div class="payment-point__usable-value">
	                <span class="amount__value"><fmt:formatNumber value="${m_point}" pattern="#,###"/></span>원
	              </div>
	            </div>
	          </div>
	        </div>
	        <div class="payment-plan">
	          <div class="payment-section-header payment-plan__header">
	            <h2>결제 수단</h2>
	          </div>
	          <div class="payment-section-body payment-plan__body">
	            <div class="payment-planList">
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
	            </div>
	          </div>
	        </div>
	      </div>
	    </main>
	    <aside>
	      <!--클래스명이 장바구니 쪽과 동일한 div가 다수 존재하지만 css는 별개로 지정해야 함-->
	      <div class="payment-sum-container">
	        <div class="payment-sum-subject">
	          <h3>결제 금액</h3>
	        </div>
	        <div class="payment-sum__short-container">
	          <div class="payment-sum__section">
	            상품 금액
	          </div>
	          <div class="payment-sum__value">
	            <span class="amount__value"><fmt:formatNumber value="${totalAmount}" pattern="#,###"/></span>원
	          </div>
	        </div>
	        <div class="payment-sum__short-container">
	          <div class="payment-sum__section">
	            배송료
	          </div>
	          <!-- 상품 테이블에 배송료 칼럼도 만들어야 함 -->
	          <div class="payment-sum__value">
	            <span class="amount__sign">+</span>
	            <span class="amount__value">0</span>원
	          </div>
	        </div>
	        <div class="payment-sum__short-container">
	          <div class="payment-sum__section">
	            쿠폰 할인
	          </div>
	          <div class="payment-sum__value">
	            <span class="amount__sign">-</span>
	            <span class="amount__value">0</span>원
	          </div>
	        </div>
	        <div class="payment-sum__short-container">
	          <div class="payment-sum__section">
	            적립금 사용
	          </div>
	          <div class="payment-sum__value">
	            <span class="amount__sign">-</span>
	            <span id="reflectedPoint" class="amount__value">0</span>원
	          </div>
	        </div>
	      </div>
	      <div class="payment-total-amount-container">
	        <div class="payment-sum__short-container">
	          <div class="total-amount payment-sum__section">
	            최종 결제 금액
	          </div>
	          <div class="total-amount payment-sum__value">
	            <span id="totalAmount" class="total-amount__value amount__value">
	            <fmt:formatNumber value="${totalAmount}" pattern="#,###"/></span>원
	          </div>
	        </div>
	        <div class="payment-will-point-container">
	          <div class="will-point__value">
	            <span id="willPoint" class="amount__value"></span>원
	          </div>
	          <div class="will-point__section">
	            적립 예정
	          </div>
	        </div>
	      </div>
	      <div class="payment-terms-container">
	        <div class="terms-confirm-container">
	          <label>
	            <input type="checkbox" id="agreeToTerms">
	            <p>아래 내용에 모두 동의합니다. (필수)</p>
	            <span class="checkMark"></span>
	          </label>
	        </div>
	        <div class="terms-content-container">
	          <div class="terms-content-top">
	            <div class="terms-content-top__subject">
	              개인정보 수집 이용 및 위탁 동의
	            </div>
	            <div class="terms-content-top__itemBox">
	              <div class="terms-content-top__topic">
	                개인정보 수집 및 이용
	              </div>
	              <div class="terms-content-top__view">
	                <a href="javascript:void(0);" onclick="openTerms('firstTerms');">약관 보기</a>
	              </div>
	            </div>
	            <div class="terms-content-top__itemBox">
	              <div class="terms-content-top__topic">
	                수집한 개인정보의 위탁
	              </div>
	              <div class="terms-content-top__view">
	                <a href="javascript:void(0);" onclick="openTerms('secondTerms');">약관 보기</a>
	              </div>
	
	            </div>
	          </div>
	          <div class="terms-content-bottom">
	            본인은 만 14세 이상이며,<br>
	            주문 내용을 확인하였습니다.
	          </div>
	        </div>
	      </div>
	      <div class="payment-button-container">
	        <button type="submit" id="checkout" onclick="return checkForCheckout()"><fmt:formatNumber value="${totalAmount}" pattern="#,###"/>원 결제하기</button>
	      </div>
	    </aside>
	  </div>
	</c:when>
	<c:when test="${noProduct ne null}">
		<div class="payment-title">
	        <h1>주문 / 결제</h1>
	    </div>
		<div class="invalidRequest">
		${noProduct}
		</div>
	</c:when>
	<c:otherwise>
		<div class="payment-title">
	        <h1>주문 / 결제</h1>
	    </div>
		<div class="invalidRequest">
	 	 유효하지 않는 요청입니다.
	 	 </div>
	</c:otherwise>
	</c:choose>
</div>
<div id="footer-space">
	<c:import url="./footer.jsp"/>
</div>
</body>
</html>