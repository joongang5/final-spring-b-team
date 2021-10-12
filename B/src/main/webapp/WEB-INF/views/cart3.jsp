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
<title>장바구니</title>
<style type="text/css">
table {
	table-layout: fixed;
	width: 80%;
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
}

th {
	background-color: gray;
}

tr {
	border-bottom: 1px gray solid;
}

td {
	text-align: center;
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
    		
    		$(totalPriceId).text(totalPriceValue);
    		
    		$("#totalPrice").text(data.totalPrice);
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
    		
    		$(totalPriceId).text(totalPriceValue);
    		
    		$("#totalPrice").text(data.totalPrice);
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
    		$("#totalPrice").text(data.totalPrice);
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
	<h1>장바구니</h1>
	<a href="./myinfo.do">회원정보조회</a>
	<a href="./myinfoUpdatePW.do">비밀번호수정</a>
	<a href="./myinfoDelete.do">회원탈퇴</a>
	<a href="./cart.do">장바구니</a>
	<hr>
	<c:choose>
	<c:when test="${fn:length(cart) gt 0 }">
		<button type ="button" class="selectDelete_btn">선택 삭제</button>
			<table>
				<tr>
					<th><input type="checkbox" name="allCheck" id="allCheck"
						class="allCheck" /><label for="allCheck">모두 선택</label></th>
					<th>상품이미지</th>
					<th>상품명</th>
					<th>수량</th>
					<th>가격</th>
					<th>삭제</th>
				</tr>
				<c:forEach items="${cart }" var="c">
					<tr>
						<td><input type="checkbox" name="chBox${c.ca_no }" class="chBox"
							value="${c.ca_no }" data-cartNum="${c.ca_no}" /></td>
						<td><img
							src="https://blogger.googleusercontent.com/img/a/${c.p_img}"
							style="width: 150px; height: 150px;"></td>
						<td>${c.p_title}</td>
						<td>
							<button onclick="down(${c.ca_no })">◀</button>
							<span id="cnt${c.ca_no}">${c.cnt}</span>
							<button onclick="up(${c.ca_no })">▶</button>
						</td>
						<td>
							<input id="unitPrice${c.ca_no}" type="hidden" value="${c.p_price}">
							<span id="totalPrice${c.ca_no}">${c.p_price * c.cnt}</span>
						</td>
						<td>
							<button type="button" name="btn${c.ca_no }" class="delete_btn" value="${c.ca_no }">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		<br>
		<form>
			<table>
				<tr>
					<th>상품 금액</th>
					<th>배송료</th>
					<th>총금액</th>
				</tr>
	
				<tr>
					<td>
						<span id="totalPrice">0</span>
						<span>원</span>
					</td>
					<td>
						<span id="shippingFee">0</span>
						<span>원</span>
					</td>
					<td>102500원</td>
				</tr>
			</table>
			<button>구입하기</button>
		</form>
	</c:when>
	<c:otherwise>
		<h2>장바구니에 상품이 없습니다.</h2>
		<h3>
			<a href="./index2.do">상품 담으러가기</a>
		</h3>
	</c:otherwise>
	</c:choose>
</body>
</html>