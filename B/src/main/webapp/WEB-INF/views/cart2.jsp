<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style type="text/css">
/*
 section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }
 */
section#content ul li {
	margin: 10px 0;
}

section#content ul li img {
	width: 200px;
	height: 200px;
}

section#content ul li::after {
	content: "";
	display: block;
	clear: both;
}

section#content div.thumb {
	float: left;
	width: 100px;
}

section#content div.gdsInfo {
	float: right;
	width: calc(100% - 270px);
}

section#content div.gdsInfo {
	font-size: 20px;
	line-height: 2;
}

section#content div.gdsInfo span {
	display: inline-block;
	width: 100px;
	font-weight: bold;
	margin-right: 10px;
}

section#content div.gdsInfo .delete {
	text-align: right;
}

section#content div.gdsInfo .delete button {
	font-size: 22px;
	padding: 5px 10px;
	border: 1px solid #eee;
	background: #eee;
}

.allCheck {
	float: left;
	width: 200px;
}

.allCheck input {
	width: 16px;
	height: 16px;
}

.allCheck label {
	margin-left: 10px;
}

.delBtn {
	float: right;
	width: 300px;
	text-align: right;
}

.delBtn button {
	font-size: 18px;
	padding: 5px 10px;
	border: 1px solid #eee;
	background: #eee;
}

.checkBox {
	float: left;
	width: 30px;
}

.checkBox input {
	width: 16px;
	height: 16px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<h1>장바구니</h1>
	<a href="./myinfo.do">회원정보조회</a>
	<a href="./myinfoUpdatePW.do">비밀번호수정</a>
	<a href="./myinfoDelete.do">회원탈퇴</a>
	<a href="./cart.do">장바구니</a>
	<hr>
	<section id="content">
		<ul>
			<li>
				<div class="allCheck">
					<input type="checkbox" name="allCheck" id="allCheck" /><label
						for="allCheck">모두 선택</label>
					<script>
						$("#allCheck").click(function() {
							var chk = $("#allCheck").prop("checked");
							if (chk) {
								$(".chBox").prop("checked", true);
							} else {
								$(".chBox").prop("checked", false);
							}
						});
					</script>
				</div>

				<div class="delBtn">
					<button type="button" class="selectDelete_btn">선택 삭제</button>
				</div>

			</li>
			<c:forEach items="${cart2}" var="cartList">
				<li>
					<div class="checkBox">
						<input type="checkbox" name="chBox" class="chBox"
							data-cartNum="${cartList.ca_no}" />
						<script>
							$(".chBox").click(function() {
								$("#allCheck").prop("checked", false);
							});
						</script>
					</div>
					<div class="thumb">
						<img
							src="https://blogger.googleusercontent.com/img/a/${cartList.p_img}" />
					</div>
					<div class="gdsInfo">
						<p>
							<span>상품명</span>${cartList.p_title}<br /> <span>개당 가격</span>
							<fmt:formatNumber pattern="###,###,###"
								value="${cartList.p_price}" />
							원<br /> <span>구입 수량</span>${cartList.cnt} 개<br /> <span>최종
								가격</span>
							<fmt:formatNumber pattern="###,###,###"
								value="${cartList.p_price * cartList.cnt}" />
							원
						</p>

						<div class="delete">
							<button type="button" class="delete_btn">삭제</button>
							<script>
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
</script>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</section>
</body>
</html>