<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>장바구니 | 가구</title>
<link rel="stylesheet" href="./resources/css/base.css">
<link rel="stylesheet" href="./resources/css/order-sheet.css">
<style>
label {
	
}

label p {
	margin-left: 39px;
}

.payment-detail-container {
	margin-top: 30px;
	/* font-size: small; */
}

.select-control-container {
	display: flex;
	justify-content: space-between;
	border-bottom: 7px solid #eeded5;
	padding: 15px 10px;
	/* background: #eeded5; */
	align-items: center;
}

.all-select-box {
	/* display: flex; */
	/* align-items: baseline; */
	
}

.all-select-box input[type="checkbox"] {
	
}

.all-select-box .checkMark {
	/* height: 22px; */
	/* width: 22px; */
	
}

.all-select-box label .checkMark:after {
	/* left: 9px; */
	/* top: 4px; */
	
}

.delete-select-box {
	font-size: 11pt;
}

.payment-product-container {
	margin: 10px 0;
}

.product-select-box {
	width: 4%;
	text-align: center;
}

.product-select-box .checkMark {
	top: -11px;
	left: -11px;
}

.option-content__cancel {
	/* align-self: flex-end; */
	display: flex;
	align-items: flex-end;
}

.option-content__cancel img {
	width: 20px;
	height: 20px;
}

.option-content__quantity-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	/* margin-bottom: 2px; */
}

.option-content__quantity {
	display: flex;
	align-items: center;
}

.option-content__quantity button {
	background: transparent;
	color: #403429;
	/* font-size: 20pt; */
	width: 18px;
	height: 17px;
}

.quantity__minus button {
	background: url('./resources/images/minus.png');
	background-size: contain;
}

.quantity__plus button {
	background: url('./resources/images/plus.png');
	background-size: contain;
}

.quantity__minus, .quantity__plus {
	
}

.quantity__value {
	margin: 0 10px;
}

.quantity__value input[type="text"] {
	width: 38px;
	border-radius: 0px;
	border: none;
	border-bottom: 2px solid #403429;
	text-align: center;
	/* margin: 0 5px; */
	height: 15px;
	padding-bottom: 10px;
	font-size: 14pt;
	background: transparent;
	font-family: math;
}

.option-content__sum {
	font-size: 14pt;
	font-weight: 800;
}

.product-select-box input[type="checkbox"] {
	
}
</style>
<script type="text/javascript">
function cartOneDelete(no){
	if(confirm("해당 상품을 삭제하시겠습니까?")){
		location.href="./cartOneDelete.do?ca_no="+no;
	}
}

function down(no){
	//alert("down" + no);
	
	var cntSpanId = "#cnt" + no;
    var strCnt = $(cntSpanId).text();
	var checkValueArr = getCheckedCartNoArr();
	var cnt = parseInt(strCnt) - 1; //숫자로 변경해서 -1
	
	if(cnt < 1){
		return;	
	}
	
	var data = {};
	data["checkValueArr"] = checkValueArr;
	data["ca_no"] = no;
	data["cnt"] = cnt;
	var sendData = JSON.stringify(data);
	
	$.ajax({
    	url : "./cartProductDown.do",
    	type : "post",
     	dataType : "json",
    	data : { "sendData" : sendData },
    	success : function(data) {
    		// 수량받기
    		$(cntSpanId).text(data.cnt);
    		
    		var unitPriceId = "#unitPrice" + no;
    		var unitPrice = $(unitPriceId).val();
    		
    		var totalPriceId = "#totalPrice" + no;
    		var totalPriceValue = data.cnt * unitPrice;
    		var totalPriceStr = totalPriceValue;
    		
    		$(totalPriceId).text(totalPriceValue.toLocaleString('ko-KR'));
    		
    		$("#totalPrice").text((data.totalPrice).toLocaleString('ko-KR'));
    	}, 
    	error : function(xhr, status, error) {
            alert("error : ", error);
      	}
   	});
}

function up(no, cnt){
	//alert("up" + no);
	//var cnt = parseInt(cnt) + 1; //숫자로 변경해서 +1
	//location.href="./cartProductUp.do?ca_no="+no+"&cnt="+cnt;
	var cntSpanId = "#cnt" + no;
    var strCnt = $(cntSpanId).text();
	var checkValueArr = getCheckedCartNoArr();
	var cnt = parseInt(strCnt) + 1; //숫자로 변경해서 -1
	
	if(cnt > 10){
		return;	
	}
	
	var data = {};
	data["checkValueArr"] = checkValueArr;
	data["ca_no"] = no;
	data["cnt"] = cnt;
	var sendData = JSON.stringify(data);
	
	$.ajax({
    	url : "./cartProductDown.do",
    	type : "post",
     	dataType : "json",
    	data : { "sendData" : sendData },
    	success : function(data) {
    		// 수량받기
    		$(cntSpanId).text(data.cnt);
    		
    		var unitPriceId = "#unitPrice" + no;
    		var unitPrice = $(unitPriceId).val();
    		
    		var totalPriceId = "#totalPrice" + no;
    		var totalPriceValue = data.cnt * unitPrice;
    		var totalPriceStr = totalPriceValue;
    		
    		$(totalPriceId).text(totalPriceValue.toLocaleString('ko-KR'));
    		
    		$("#totalPrice").text((data.totalPrice).toLocaleString('ko-KR'));
    	}, 
    	error : function(xhr, status, error) {
            alert("error : ", error);
      	}
   	});
}

$(document).ready(function(){
	$("#allCheck").click(function() {
		var chk = $("#allCheck").prop("checked");
		if (chk) {
			$(".chBox").prop("checked", true);
		} else {
			$(".chBox").prop("checked", false);
		}

		onclickCheckBoxAJAX();
		/* var cnt = parseInt(cnt) + 1; //숫자로 변경해서 +1
		location.href="./onclickCheckBox.do?ca_no="+no+"&cnt="+cnt; */
	});
	
	$(".chBox").click(function(){
		$("#allCheck").prop("checked", false);

		onclickCheckBoxAJAX();
	});
	
	$(".selectDelete_btn").click(function(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		  
	  	if(confirm_val) {
	  		onclickDeleteAllButton();
	  	} 
	});
	
	$(".delete_btn").click(function(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		  
	  	if(confirm_val) {
	  		var caNo= $(this).val();
	  		onclickDeleteOneButton(caNo);
	  	} 
	});
});

// 체크박스가 클릭될때 마다 실행될 내용
function onclickCheckBoxAJAX() {
	var checkValueArr = getCheckedCartNoArr();
	
	// 만약 선택된 체크박스가 하나도 없다면
	if (checkValueArr.length <= 0){
		// 합계를 계산 할 필요가 없기 때문에 그냥 0으로 설정 후 마친다.
		$("#totalPrice").text("0");
		return;
	}
	
	// 선택된 체크박스가 하나 이상인 경우 컨트롤러에 선택된 카트 넘버들을 보낸다.
   	$.ajax({
    	url : "./onclickCheckBoxAJAX.do",
    	type : "post",
     	traditional : true,
     	dataType : "json",
    	data : { "checkValueArr" : checkValueArr },
    	success : function(data) {
    		$("#totalPrice").text((data.totalPrice).toLocaleString('ko-KR'));
    	}, 
    	error : function(xhr, status, error) {
            alert("error : ", error);
      	}
   	});
}

// 선택 삭제 버튼이 클릭될 때 마다 처리
function onclickDeleteAllButton() {
	var checkValueArr = getCheckedCartNoArr();
	
	// 만약 선택된 체크박스가 하나도 없다면
	if(checkValueArr.length <= 0){
		// 삭제를 할 필요가 없기 때문에 그냥 끝낸다.
		return;
	}
	
	// 선택된 체크박스가 하나 이상인 경우 컨트롤러에 선택된 카트 넘버들을 보낸다.
	$.ajax({
    	url : "./onclickDeleteAllButtonAJAX.do",
    	type : "post",
     	traditional : true,
    	data : { "checkValueArr" : checkValueArr },
    	success : function(result) {
    		if (result > 0) {
    			location.href="./cart.do";
    		} else {
	    		alert("실패 메세지");
    		}
    	}, 
    	error : function(xhr, status, error) {
            alert("error : ", error);
      	}
   	});
}

//상품에 삭제버튼을 눌렀을 때 처리(하나만 삭제)
function onclickDeleteOneButton(caNo) {
	
	$.ajax({
    	url : "./onclickDeleteOneButtonAJAX.do",
    	type : "post",
    	data : { "caNo" : caNo },
    	success : function(result) {
    		if (result > 0) {
    			location.href="./cart.do";
    		} else {
	    		alert("해당 상품이 장바구니에 존재하지 않습니다.");
    		}
    	}, 
    	error : function(xhr, status, error) {
            alert("error : ", error);
      	}
   	});
}

function getCheckedCartNoArr(){
	// 문서상에 있는 모든 체크박스를 찾아온다. (클래스명을 chBox으로 설정한 것들)
	var checkArr = document.getElementsByClassName("chBox");
	// 그 중 필요한 체크박스는 선택된 체크박스이기 때문에 새로 배열을 만들어서
	// 선택된 체크박스만 모아 놓는다.
	var checkValueArr = new Array(); 
	for(var i = 0; i < checkArr.length; i++){
		var item = checkArr[i];
		if(item.checked){
			// 실제로 배열에 저장되는 값은 카트 넘버이다.
			checkValueArr.push(item.value);
		}
	}
	return checkValueArr;
}
</script>
</head>
<body>
	<div id="layout-container">
		<header id="header-space"></header>
		<div id="payment-main-container">
			<main>
				<div class="payment-title">
					<h1>장바구니</h1>
				</div>
				<c:choose>
					<c:when test="${fn:length(cart) gt 0 }">
						<div class="payment-detail-container">
							<div class="select-control-container">
								<div class="all-select-box">
									<label for="allCheck"> <input type="checkbox"
										name="allCheck" id="allCheck" class="allCheck" />
									<p>모두 선택</p> <span class="checkMark"></span>
									</label>
								</div>
								<div class="delete-select-box">
									<a class="selectDelete_btn">선택 삭제</a>
								</div>
							</div>
							<div class="payment-product-container">
								<!--장바구니 내 상품 출력 / 반복문 사용-->
								<c:forEach items="${cart }" var="c">
									<div class="payment-product-content">
										<div class="product-select-box">
											<label> <input type="checkbox"
												name="chBox${c.ca_no }" class="chBox" value="${c.ca_no }"
												data-cartNum="${c.ca_no}" /> <span class="checkMark"></span>
											</label>
										</div>
										<div class="payment-product-left-block">
											<div class="product-content__productThumbnail">
												<img
													src="https://blogger.googleusercontent.com/img/a/${c.p_img}"
													style="width: 150px; height: 150px;">
												<!-- <img src="./resources/images/no-image.png"> -->
											</div>
										</div>
										<div class="payment-product-right-block">
											<div class="product-content__name-container">
												<div class="product-content__name">${c.p_title}</div>
												<div class="product-content__cancel">
													<button type="button" name="btn${c.ca_no }"
														class="delete_btn" value="${c.ca_no }">
														<img src="./resources/images/close.png">
													</button>
												</div>
											</div>
											<div class="product-content__option-container">
												<div class="option-content__name-container">
													<div class="option-content__name">옵션</div>
													<div class="option-content__cancel">
														<button type="button" name="btn${c.ca_no }"
															class="delete_btn" value="${c.ca_no }">
															<img src="./resources/images/close.png">
														</button>
													</div>
												</div>
												<div class="option-content__quantity-container">
													<div class="option-content__quantity">
														<div class="quantity__minus">
															<button onclick="down(${c.ca_no })"></button>
														</div>
														<div class="quantity__value">
															<!--유효성 검사 함수 넣기-->
															<!-- <input type="text" value="1" readonly="readonly"> -->
															<span id="cnt${c.ca_no}">${c.cnt}</span>
														</div>
														<div class="quantity__plus">
															<button onclick="up(${c.ca_no })"></button>
														</div>
													</div>
													<div class="option-content__sum">
														<input id="unitPrice${c.ca_no}" type="hidden"
															value="${c.p_price}"> <span class="amount__value"
															id="totalPrice${c.ca_no}"><fmt:formatNumber value="${c.p_price * c.cnt}" pattern="#,###"/></span>원
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>

								<!--샘플용 2번째 레이어-->
								<!-- <div class="payment-product-content">
                            <div class="product-select-box">
                                <label>
                                    <input type="checkbox">
                                    <span class="checkMark"></span>
                                </label>
                            </div>
                            <div class="payment-product-left-block">
                                <div class="product-content__productThumbnail">
                                    <img src="./resources/images/no-image.png">
                                </div>
                            </div>
                            <div class="payment-product-right-block">
                                <div class="product-content__name-container">
                                    <div class="product-content__name">
                                        상품명
                                    </div>
                                    <div class="product-content__cancel">
                                        <img src="./resources/images/close.png">
                                    </div>
                                </div>
                                <div class="product-content__option-container">
                                    <div class="option-content__name-container">
                                        <div class="option-content__name">
                                            옵션
                                        </div>
                                        <div class="option-content__cancel">
                                            <img src="./resources/images/close.png">
                                        </div>
                                    </div>
                                    <div class="option-content__quantity-container">
                                        <div class="option-content__quantity">
                                            <div class="quantity__minus">
                                                <button></button>
                                            </div>
                                            <div class="quantity__value">
                                                유효성 검사 함수 넣기
                                                <input type="text" value="1" readonly="readonly">
                                            </div>
                                            <div class="quantity__plus">
                                                <button></button>
                                            </div>
                                        </div>
                                        <div class="option-content__sum">
                                            <span class="amount__value">50,000</span>원
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
								<!--장바구니 내 상품 출력 끝-->
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<h2>장바구니에 상품이 없습니다.</h2>
						<h3>
							<a href="./index.do">상품 담으러가기</a>
						</h3>
					</c:otherwise>
				</c:choose>
			</main>
			<aside>
				<div class="payment-sum-container">
					<div class="payment-sum__short-container">
						<div class="payment-sum__section">상품 금액</div>
						<div class="payment-sum__value">
							<span class="amount__value" id="totalPrice">0</span>원
						</div>
					</div>
					<div class="payment-sum__short-container">
						<div class="payment-sum__section">배송료</div>
						<div class="payment-sum__value">
							<span class="amount__sign">+</span> <span class="amount__value">0</span>원
						</div>
					</div>
				</div>
				<div
					class="payment-total-amount-container payment-sum__short-container">
					<div class="total-amount payment-sum__section">합계</div>
					<div class="total-amount payment-sum__value">
						<span class="amount__value">0</span>원
					</div>
				</div>
				<div class="payment-button-container">
					<button>상품 구매하기</button>
				</div>
			</aside>
		</div>
		<footer id="footer-space"></footer>
	</div>
</body>
</html>