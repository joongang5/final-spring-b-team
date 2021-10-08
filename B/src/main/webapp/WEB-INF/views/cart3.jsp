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

function down(no, cnt){
	//alert("down" + no);
	var cnt = parseInt(cnt) - 1; //숫자로 변경해서 -1
	location.href="./cartProductDown.do?ca_no="+no+"&cnt="+cnt;
}

function up(no, cnt){
	//alert("up" + no);
	var cnt = parseInt(cnt) + 1; //숫자로 변경해서 +1
	location.href="./cartProductUp.do?ca_no="+no+"&cnt="+cnt;
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
	   		var checkArr = new Array();
	   
	   		$("input[class='chBox']:checked").each(function(){
	    		checkArr.push($(this).attr("data-cartNum"));
	   		});
	    
		   	$.ajax({
		    	url : "/shop/deleteCart",
		    	type : "post",
		    	data : { chbox : checkArr },
		    	success : function(){
		     	location.href = "/shop/cartList";
		     	}
		   	});
	  	} 
	});
});

function onclickCheckBoxAJAX() {
	var checkArr = document.getElementsByClassName("chBox");
	var checkValueArr = new Array();
	for (var i = 0; i < checkArr.length; i++) {
		var item = checkArr[i];
		if (item.checked) {
			checkValueArr.push(item.value);
		}
	}
	
	if (checkValueArr.length <= 0){
		$("#totalPrice").val("0");
		return;
	}
   	$.ajax({
    	url : "./onclickCheckBoxAJAX.do",
    	type : "post",
     	traditional : true,
     	dataType : "json",
    	data : { "checkValueArr" : checkValueArr },
    	success : function(data) {
    		$("#totalPrice").val(data.totalPrice);
    	}, 
    	error : function(xhr, status, error) {
            alert("error : ", error);
      	}
   	});
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
						<td class="countP" id="cBtn"><span class="productCount${c.ca_no }">${c.cnt}</span></td>
						<td class="totalP"><input class="totalPrice${c.ca_no }" type="hidden" value="${c.p_price}"><fmt:formatNumber pattern="###,###,###"
								value="${c.p_price * c.cnt}" /></td>
						<td><button>삭제</button></td>
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
					<td><input id="totalPrice" type="text" value="0"/>원</td>
					<td>2500원</td>
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