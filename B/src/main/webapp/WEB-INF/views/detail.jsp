<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[${detail.c_main } > ${detail.c_sub }]${detail.p_title }</title>
<link href="./resources/css/header.css" rel="stylesheet"/>
<link href="./resources/css/reset.css" rel="stylesheet"/>
<link href="./resources/css/footer.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
/* reset.css */
/* header.css */
/* footer.css */
/* container.css */	
#wrapper{width:100%;margin:0 auto;}
	#container{width:100%;padding-top:170px;padding-bottom:300px;}
		#mainContainer{width:100%;}
			#productDetail{width:1200px;min-height:400px;margin:0 auto;column-count: 2;column-gap: 50px;column-rule-color: #eee;column-rule-style: solid;column-width: 1px;padding-bottom:25px;}
				#productDetail .pdSon{width:100%;min-height:400px;}
				#productImg{width:100%;}
					#productImg img{display:block;width:100%;}
				#productContent{}
					#title{padding:10px 0;border-bottom:2px solid #ddd;}
						#link{display:inline-block;float:right;padding:5px;border:1px solid #ccc;border-radius:24px;font-size:12px;cursor:pointer;}
					#price{text-indent:10px;padding:30px 0;font-size:20px;color:red;font-weight:700;border-bottom:1px solid #ddd;}
					#content{padding:12px 0;border-bottom:1px solid #ddd;}
						#content div{padding-bottom:6px;}
					#buy{padding-top:12px;border-bottom:1px solid #ddd;}
						#buy div{padding-bottom:6px;width:100%;}
							#buy button{cursor:pointer;padding:5px 10px;border:1px solid #ddd;background-color:#fff;outline:none;}
							#buy button:hover{background-color:#ccc;}
							#buy input{padding:5px 10px;text-align:center;border:1px solid #ddd;outline:none;cursor:default;}
							#buy input::-webkit-outer-spin-button,
						    #buy input::-webkit-inner-spin-button {-webkit-appearance: none;}
							#total{font-size:24px;color:#FF8A00;}
							
						.right{text-align:right;}
							.gray{display:inline-block;width:90px;color:#999;font-size:14px;font-weight:600;text-align:left;float:left;padding-top:2.5px;}
						
					#buyBtn{width:100%;column-count: 2;column-gap: 20px;padding-top:15px;}
						#buyBtn p{width:100%;height:40px;line-height:40px;text-align:center;border:1px solid #FF8A00;cursor:pointer;transition:0.3s all;}
						#buyBtn p:first-child{background-color:#fff;color:#FF8A00;}
						#buyBtn p:last-child{background-color:#FF8A00;color:#fff;}
						#buyBtn p:hover{background-color:#403429;color:#fff;}
			
			#reviewArea{width:100%;padding-top:30px;}
				#reviewBar{width:100%;border-top:1px solid #ddd;border-bottom:1px solid #ddd;padding:5px 0;background-color:#fff;}
					#reviewNav{width:1200px;margin:0 auto;overflow:hidden;display:flex;justify-content: space-evenly;}
						#reviewNav li {float:left;padding:5px 20px;}
							#reviewNav li a{padding:5px 20px;}
							#reviewNav li a:hover, #reviewNav li a:focus{text-decoration:none;}
						.selected{background-color:#FF8A00;color:#fff;font-weight:600;}
				
				#review{clear:both;width:1200px;margin:0 auto;padding-top:25px;}
					#review li{padding-top:50px;text-align:center;}
						#review .service{font-size:24px;font-weight:700;}
							#review .service img{width:500px;}
				
						
	#container:after{content:"";display:block;clear:both;}
</style>
<script>
$(function(){
	$("#link").click(function(){
		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URL이 복사되었습니다.")
	});
	$("#buy button").click(function(){
		var status = $(this).attr("id");
		var price = $("#totalVal").val();
		var cnt = $("#detailCnt").val();
		if(status == "down"){
			if(cnt == 1){
				return false;
			}
			cnt = parseInt(cnt)-1;
			$("#detailCnt").val(cnt);
			$("#total").text((price*cnt).toLocaleString('ko-KR'));
		}else{
			if(cnt == "${detail.p_cnt - detail.p_sell }"){
				return false;
			}
			cnt = parseInt(cnt)+1;
			$("#detailCnt").val(cnt);
			$("#total").text((price*cnt).toLocaleString('ko-KR'));
		}
	});
	$("#buyBtn p").click(function(){
		var index = $(this).index();
		if(index == 0){
			alert("장바구니에 담음");
		}else{
			alert("질러~");
		}
	});
	$("#review li:not(:first)").hide();
	$("#reviewNav li a").on("click focusin", function(){
		$("#review li").hide();
		$($(this).attr("href")).show();
		$("#reviewNav li a").removeClass("selected");
		$(this).addClass("selected");
		return false;
	});
	var subNav = $("#reviewBar");
	var wrapMarginT = parseInt($("#wrapper").css("marginTop"));
	var headH = wrapMarginT + 127 + $("#productDetail").height();
	$(window).scroll(function(){
		var nowScroll = $(document).scrollTop();
		if(nowScroll >= headH ){
			subNav.css({"position":"fixed","top":"127px"});
		}
		else{
			subNav.css({"position":"static"});
		}
	});
});
</script>
</head>
<body>
	<div id="wrapper">
		<c:import url="/header.do"/>
		<div id="container">
			<div id="mainContainer">
				<div id="productDetail">
					<div id="productImg" class="pdSon">
						<img src="https://blogger.googleusercontent.com/img/a/${detail.p_img }" alt="${detail.p_title }" class="img"/>
					</div>
					<div id="productContent" class="pdSon">
						<h4><span style="color:#666;font-size:14px;">[${detail.c_main } > ${detail.c_sub }]</span></h4>
						<div id="title">
							<strong style="font-size:18px;font-weight:600;">${detail.p_title }</strong><span id="link">link</span>
						</div>
						<div id="price">
							<fmt:formatNumber value="${detail.p_price }" pattern="#,###"/>원
						</div>
						<div id="content">
							<div><span class="gray">배송정보</span>상품정보 확인</div>
							<div><span class="gray">상품재고</span><span <c:if test="${(detail.p_cnt - detail.p_sell) le 10 }">style="color:red;"</c:if>>${detail.p_cnt - detail.p_sell }</span></div>
						</div>
						<div id="buy">
							<div class="right">
								<span class="gray">수량선택</span>
								<button id="down">-</button>
								<input id="detailCnt" type="number" value="1" min="1" max="${detail.p_cnt - detail.p_sell }" readonly="readonly"/>
								<button id="up">+</button>
							</div>
							<div class="right">
								<span class="gray">최종금액</span><b id="total"><fmt:formatNumber value="${detail.p_price }" pattern="#,###"/></b>원
								<input type="hidden" id="totalVal" value="${detail.p_price }"/>
							</div>
						</div>
						<div id="buyBtn">
							<p>장바구니</p><p>구매하기</p>
						</div>
					</div>
				</div>
				<div id="reviewArea">
					<div id="reviewBar">
						<ul id="reviewNav">
							<li><a class="selected" href="#tab0" title="배송정보">배송정보</a></li>
							<li><a href="#tab1" title="리뷰">리뷰</a></li>
							<li><a href="#tab2" title="문의사항">문의사항</a></li>
						</ul>
					</div>
					<ul id="review">
						<li id="tab0"><img src="./resources/images/detail.jpg" alt="배송정보"/></li>
						<li id="tab1" class="service">서비스 준비중입니다...<br><img src="./resources/images/Logo.png" alt="Spring.B"/></li>
						<li id="tab2" class="service">서비스 준비중입니다...<br><img src="./resources/images/Logo.png" alt="Spring.B"/></li>
					</ul>
				</div>
			</div>
		</div>
		<c:import url="./footer.jsp"/>
	</div>
</body>
</html>