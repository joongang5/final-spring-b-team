<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>주문배송내역 조회 | Spring.B</title>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />

<!-- <link rel="stylesheet" href="./resources/css/base.css">  -->
<link rel="stylesheet" href="./resources/css/mypage.css">
<link rel="stylesheet" href="./resources/css/invoice.css">
<link rel="stylesheet" href="./resources/css/reset.css">


<style>

/* footer css */
footer {
	width: 100%;
	border-top: 2px solid;
	border-image: linear-gradient(to right, #fff, #FFA335, #F2E3D5);
	border-image-slice: 1;
	background-color: #F2E3D5;
	height: 200px;
	position:absolute;bottom:-250px;left:0;
}

#footer {
	width: 1200px;
	margin: 0 auto;
	font-size: 12px;
	text-align:left; 
}

#sns {
	height: 40px;
	padding-top: 10px;
}

#sns p {
	display: inline-flex;
	margin-right: 8px;
}

#sns p img {
	width: 24px;
	cursor: pointer;
}

#law {
	height: 40px;
	padding-top: 30px;
}

#law span {
	margin-right: 8px;
	cursor: pointer;
}

#view {
	width: 980px;
	max-height: 90vh;
	position: fixed;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	overflow: auto;
	padding: 10px;
	border: 3px solid;
	border-color: Gold PapayaWhip PeachPuff Moccasin;
	box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.5);
	z-index: 100;
}

#view .userLaw {
	display: none;
}

#view .useLaw {
	display: none;
}

#full {
	position: fixed;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	left: 0;
	top: 0;
	z-index: 99;
}

/* add 슬라이드 이미지 */
.slider {
	width: 1082px;
	height: 200px;
	position: relative;
	margin: 0 auto;
	overflow: hidden; /* 현재 슬라이드 오른쪽에 위치한 나머지 슬라이드 들이 보이지 않도록 가림 */
}

.slider input[type=radio] {
	display: none;
}

ul.imgs {
	padding: 0;
	margin: 0;
	list-style: none;
}

ul.imgs li {
	position: absolute;
	left: 50px;
	transition-delay: 1s; /* 새 슬라이드가 이동해 오는 동안 이전 슬라이드 이미지가 배경이 보이도록 지연 */
	padding: 0;
	margin: 0;
}

.bullets {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	bottom: 3px;
	z-index: 2;
}

.bullets label {
	display: inline-block;
	border-radius: 50%;
	background-color: rgba(180, 4, 106, 0.5);
	width: 15px;
	height: 15px;
	cursor: pointer;
}
/* 현재 선택된 불릿 배경 흰색으로 구분 표시 */
.slider input[type=radio]:nth-child(1):checked ~.bullets>label:nth-child(1)
	{
	background-color: #fff;
}

.slider input[type=radio]:nth-child(2):checked ~.bullets>label:nth-child(2)
	{
	background-color: #fff;
}

.slider input[type=radio]:nth-child(3):checked ~.bullets>label:nth-child(3)
	{
	background-color: #fff;
}

.slider input[type=radio]:nth-child(4):checked ~.bullets>label:nth-child(4)
	{
	background-color: #fff;
}

.slider input[type=radio]:nth-child(1):checked ~ul.imgs>li:nth-child(1)
	{
	left: 0;
	transition: 0.5s;
	z-index: 1;
}

.slider input[type=radio]:nth-child(2):checked ~ul.imgs>li:nth-child(2)
	{
	left: 0;
	transition: 0.5s;
	z-index: 1;
}

.slider input[type=radio]:nth-child(3):checked ~ul.imgs>li:nth-child(3)
	{
	left: 0;
	transition: 0.5s;
	z-index: 1;
}

.slider input[type=radio]:nth-child(4):checked ~ul.imgs>li:nth-child(4)
	{
	left: 0;
	transition: 0.5s;
	z-index: 1;
}

/* add 스크롤 바*/
::-webkit-scrollbar {
	width: 16px;
}

::-webkit-scrollbar-track {
	background-color: #EEDED5;
}

::-webkit-scrollbar-thumb {
	background-color: #403429;
	border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
	
}

::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment
	{
	width: 16px;
	height: 16px;
	background: #EEDED5;
}

/* add 테두리 */
.orderList-summary {
	display: flex;
	border: 10px dashed #EEDED5;
	margin: 10px 10px 10px 10px;
	padding: 30px;
}

/* add 버튼 */
.snip1535 {
	background-color: #c47135;
	border: none;
	color: #ffffff;
	cursor: pointer;
	display: inline-block;
	font-family: 'BenchNine', Arial, sans-serif;
	font-size: 1em;
	font-size: 10px;
	line-height: 1em;
	margin: 5px 5px;
	outline: none;
	padding: 10px 40px 10px;
	position: relative;
	text-transform: uppercase;
	font-weight: 700;
}

.snip1535:before, .snip1535:after {
	border-color: transparent;
	-webkit-transition: all 0.25s;
	transition: all 0.25s;
	border-style: solid;
	border-width: 0;
	content: "";
	height: 24px;
	position: absolute;
	width: 24px;
}

.snip1535:before {
	border-color: #c47135;
	border-right-width: 2px;
	border-top-width: 2px;
	right: -5px;
	top: -5px;
}

.snip1535:after {
	border-bottom-width: 2px;
	border-color: #c47135;
	border-left-width: 2px;
	bottom: -5px;
	left: -5px;
}

.snip1535:hover, .snip1535.hover {
	background-color: #c47135;
}

.snip1535:hover:before, .snip1535.hover:before, .snip1535:hover:after,
	.snip1535.hover:after {
	height: 100%;
	width: 100%;
}

/* Default */
input[type=text], input[type=password] {
	font-family: "Malgun Gothic", "맑은 고딕", Dotum, "돋움", Arial, sans-serif
}

* {
	margin: 0;
	padding: 0;
	text-align: none;
	/* 	font-family: "Malgun Gothic", "맑은 고딕", Dotum, "돋움", Arial, sans-serif;
 */
	font-family: 'Noto Serif KR', serif;
}

body {
	font-size: 15px;
	color: #403429;
	background: transparent;
	-webkit-user-select: none;
	-moz-user-select: none;
	-webkit-text-size-adjust: none;
	-moz-text-size-adjust: none;
	-ms-text-size-adjust: none;
	text-align: center;
}

ol, ul {
	list-style: none
}

table {
	table-layout: fixed;
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0
}

caption {
	overflow: hidden;
	width: 0;
	height: 0;
	font-size: 0;
	line-height: 0;
	text-indent: -999em
}

img, fieldset {
	border: 0
}

legend {
	height: 0;
	visibility: hidden
}

em, address {
	font-style: normal
}

img {
	border: 0 none;
	vertical-align: middle
}

a {
	color: #555;
	text-decoration: none
}

input, select {
	margin: 0;
	padding: 0;
	vertical-align: middle
}

button {
	margin: 0;
	padding: 0;
	font-family: inherit;
	border: 0 none;
	background: transparent;
	cursor: pointer
}

button::-moz-focus-inner {
	border: 0;
	padding: 0
}

header, footer, aside, nav, section, article {
	display: block
}

.clearfix {
	*zoom: 1
}

.clearfix:after {
	content: "";
	display: block;
	clear: both;
	overflow: hidden
}

/* Search */
.searchBox {
	border: none
}

.searchBox tbody th {
	padding: 35px 10px 10px 30px;
	font-size: 14px;
	font-weight: bold;
	text-align: left;
	vertical-align: top;
	border: none;
	font-size: 14px;
	font-weight: bold;
	text-align: left;
	vertical-align: top;
	border: none;
	background: #FFAA28;
	font-weight: bold;
	text-align: left;
	vertical-align: top;
	border: none;
	font-size: 20px;
	font-weight: bold;
	text-align: left;
	vertical-align: top;
	border: none;
	/* background: #e6e6e6 */
}

.searchBox tbody td {
	padding: 12px 10px 12px 25px;
	border: none;
	background: #FDEBC8;
	/* 	background-color: #efefef */
}

.searchDate {
	overflow: hidden;
	margin-bottom: 10px;
	*zoom: 1
}

.searchDate:after {
	display: block;
	clear: both;
	content: ''
}

.searchDate li {
	position: relative;
	float: left;
	margin: 0 7px 0 0
}

.searchDate li .chkbox2 {
	display: block;
	text-align: center;
}

.searchDate li .chkbox2 input {
	position: absolute;
	z-index: -1
}

.searchDate li .chkbox2 label {
	display: block;
	width: 72px;
	height: 26px;
	font-size: 14px;
	font-weight: bold;
	color: #fff;
	/* color: black; */
	text-align: center;
	line-height: 25px;
	text-decoration: none;
	cursor: pointer;
	/* background: #a5b0b6; */
	background: #FFC846;
}

.searchDate li .chkbox2.on label {
	background: #ec6a6a
}

.demi {
	display: inline-block;
	margin: 0 1px;
	vertical-align: middle;
}

.inpType {
	padding-left: 6px;
	height: 24px;
	line-height: 24px;
	border: 1px solid #dbdbdb;
	text-align: center;
}

.btncalendar {
	display: inline-block;
	width: 22px;
	height: 22px;
	background: url(images/btn_calendar.gif) center center no-repeat;
	text-indent: -999em
}
</style>

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

<script>
	$(document).ready(function() {

		//datepicker 한국어로 사용하기 위한 언어설정
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		// Datepicker            
		$(".datepicker").datepicker({
			showButtonPanel : true,
			dateFormat : "yy-mm-dd",
			onClose : function(selectedDate) {

				var eleId = $(this).attr("id");
				var optionName = "";

				if (eleId.indexOf("StartDate") > 0) {
					eleId = eleId.replace("StartDate", "EndDate");
					optionName = "minDate";
				} else {
					eleId = eleId.replace("EndDate", "StartDate");
					optionName = "maxDate";
				}

				$("#" + eleId).datepicker("option", optionName, selectedDate);
				$(".searchDate").find(".chkbox2").removeClass("on");
			}
		});

		//시작일.
		/*$('#searchStartDate').datepicker("option","onClose", function( selectedDate ) {    
		    // 시작일 datepicker가 닫힐때
		    // 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
		    $("#searchEndDate").datepicker( "option", "minDate", selectedDate );
		    $(".searchDate").find(".chkbox2").removeClass("on");
		});
		 */

		//종료일.
		/*$('#searchEndDate').datepicker("option","onClose", function( selectedDate ) {    
		    // 종료일 datepicker가 닫힐때
		    // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
		    $("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
		    $(".searchDate").find(".chkbox2").removeClass("on");
		});
		 */

		$(".dateclick").dateclick(); // DateClick
		$(".searchDate").schDate(); // searchDate

	});

	// Search Date
	jQuery.fn.schDate = function() {
		var $obj = $(this);
		var $chk = $obj.find("input[type=radio]");
		$chk.click(function() {
			$('input:not(:checked)').parent(".chkbox2").removeClass("on");
			$('input:checked').parent(".chkbox2").addClass("on");
		});
	};

	// DateClick
	jQuery.fn.dateclick = function() {
		var $obj = $(this);
		$obj.click(function() {
			$(this).parent().find("input").focus();
		});
	}

	function setSearchDate(start) {

		var num = start.substring(0, 1);
		var str = start.substring(1, 2);

		var today = new Date();

		//var year = today.getFullYear();
		//var month = today.getMonth() + 1;
		//var day = today.getDate();

		var endDate = $.datepicker.formatDate('yy-mm-dd', today);
		$('#searchEndDate').val(endDate);

		if (str == 'd') {
			today.setDate(today.getDate() - num);
		} else if (str == 'w') {
			today.setDate(today.getDate() - (num * 7));
		} else if (str == 'm') {
			today.setMonth(today.getMonth() - num);
			today.setDate(today.getDate() + 1);
		}

		var startDate = $.datepicker.formatDate('yy-mm-dd', today);
		$('#searchStartDate').val(startDate);

		// 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
		$("#searchEndDate").datepicker("option", "minDate", startDate);

		// 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
		$("#searchStartDate").datepicker("option", "maxDate", endDate);

	}

	//footer 추가
	$(function() {
		//법률 정보
		$("#view, #full").hide();
		$("#law span").click(function() {
			$("#view, #full").show();
			$("." + $(this).attr("id")).css({
				"display" : "block"
			});
			return false;
		});
		$("#view, #full").click(function() {
			$("#view, #full").hide();
			$("#view div").css({
				"display" : "none"
			});
		});
	});
</script>

</head>
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
							<li class="sideMenu__item"><a href="">상품 문의</a></li>
							<li class="sideMenu__item"><a href="">1:1 문의</a></li>
						</ul>
					</div>
					<div class="sideMenu__block">
						<h3>회원 정보</h3>
						<ul class="sideMenu__items">
							<li class="sideMenu__item"><a href="./myinfo.do">회원 정보
									조회</a></li>
							<li class="sideMenu__item"><a href="">주소록</a></li>
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


				<!-- <img src="http://localhost/img/furniturepic.png"
	style="width: 150px; height: 150px;"> -->
				<br> <br> <br> <br>
				<h1 align="left">주문배송내역</h1>

				<!-- <h3 align="center">진행상황</h3> -->
				<br>

				<div class="orderList-summary__column-left">
					<div class="orderList-summary">
						<table>
							<tr>
								<th style="font-size: 20px;">결제 완료</th>
								<th rowspan="3"><marquee direction=right>
										<img src="./resources/images/right-arrow-org.png">
									</marquee></th>
								<th style="font-size: 20px;">출고 준비</th>
								<th rowspan="3"><marquee direction=right>
										<img src="./resources/images/right-arrow-org.png">
									</marquee></th>
								<th style="font-size: 20px;">출고 완료</th>
							</tr>
							<tr>
								<td style="font-size: 30px; color: orange; font-weight: bold;">${stateTotalCountArr[0] }</td>
								<td style="font-size: 30px; color: orange; font-weight: bold;">${stateTotalCountArr[1] }</td>
								<td style="font-size: 30px; color: orange; font-weight: bold;">${stateTotalCountArr[2] }</td>

								<%-- <c:forEach items="${stateTotalCountArr }" var="stateTotalCount">
				<td>${stateTotalCount }</td>
			</c:forEach> --%>
							</tr>
						</table>
					</div>
				</div>

				<br>

				<!-- 슬라이드 기능 추가 -->
				<div class="slider">
					<input type="radio" name="slide" id="slide1" checked> <input
						type="radio" name="slide" id="slide2"> <input type="radio"
						name="slide" id="slide3"> <input type="radio" name="slide"
						id="slide4">
					<ul id="imgholder" class="imgs">
						<li><img src="./resources/images/banner1.jpg"></li>
						<li><img src="./resources/images/banner2.jpg"></li>
						<li><img src="./resources/images/banner3.jpg"></li>
						<li><img src="./resources/images/banner4.jpg"></li>

					</ul>
					<div class="bullets">
						<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
						<label for="slide3">&nbsp;</label> <label for="slide4">&nbsp;</label>
					</div>
				</div>

				<br> <br> <br>
				<form action="./orderhistory1.do" method="get">
					<!-- search -->
					<table class="searchBox">
						<caption>주문 조회</caption>
						<colgroup>
							<col width="123px">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th style="color: white;">주문일</th>
								<td>
									<ul class="searchDate">
										<li><span class="chkbox2"> <input type="radio"
												name="dateType" id="dateType1" onclick="setSearchDate('0d')" />
												<label for="dateType1">당일</label>
										</span></li>
										<li><span class="chkbox2"> <input type="radio"
												name="dateType" id="dateType2" onclick="setSearchDate('3d')" />
												<label for="dateType2">3일</label>
										</span></li>
										<li><span class="chkbox2"> <input type="radio"
												name="dateType" id="dateType3" onclick="setSearchDate('1w')" />
												<label for="dateType3">1주</label>
										</span></li>
										<li><span class="chkbox2"> <input type="radio"
												name="dateType" id="dateType4" onclick="setSearchDate('2w')" />
												<label for="dateType4">2주</label>
										</span></li>
										<li><span class="chkbox2"> <input type="radio"
												name="dateType" id="dateType5" onclick="setSearchDate('1m')" />
												<label for="dateType5">1개월</label>
										</span></li>
										<li><span class="chkbox2"> <input type="radio"
												name="dateType" id="dateType6" onclick="setSearchDate('3m')" />
												<label for="dateType6">3개월</label>
										</span></li>
										<li><span class="chkbox2"> <input type="radio"
												name="dateType" id="dateType7" onclick="setSearchDate('6m')" />
												<label for="dateType7">6개월</label>
										</span></li>
									</ul>

									<div class="clearfix">
										<!-- 시작일 -->
										<span class="dset"> <input type="text"
											class="datepicker inpType" name="searchStartDate"
											id="searchStartDate"
											<c:if test="${startDay ne null }">value=${startDay }</c:if>>
											<a href="#none" class="btncalendar dateclick">달력</a>
										</span> <span class="demi">~</span>
										<!-- 종료일 -->
										<span class="dset"> <input type="text"
											class="datepicker inpType" name="searchEndDate"
											id="searchEndDate"
											<c:if test="${endDay ne null }">value=${endDay }</c:if>>
											<a href="#none" class="btncalendar dateclick">달력</a>
											<button class="snip1535">조회</button>
										</span>
									</div>
								</td>
							</tr>
						<tbody>
					</table>
				</form>

				<br> <br>
				<h3 align="left">주문 리스트</h3>
				<br> <br>
				<table>
					<tr>
						<th>no</th>
						<th>제품명</th>
						<th>제품 이미지</th>
						<th>수량</th>
						<th>가격</th>
						<th>결제 방식</th>
						<th>주문 날짜</th>
						<th>현재 상태</th>
						<th>교환 신청</th>

					</tr>
					<c:forEach items="${list }" var="l">
						<tr>
							<td>${l.p_no}</td>
							<td>${l.p_title}</td>
							<td><img
								src="https://blogger.googleusercontent.com/img/a/${l.p_img}"
								style="width: 110px; height: 110px;"></td>
							<td>${l.cnt}</td>
							<td>${l.p_price}원</td>

							<td><c:if test="${l.pa_plan eq 'kakaopay'}">
									<img src="./resources/images/kakaopay.png">
								</c:if> <c:if test="${l.pa_plan eq 'payco'}">
									<img src="./resources/images/payco.png">
								</c:if>
								<c:if test="${l.pa_plan eq 'inicis'}">
									<img src="./resources/images/inicis.png">
								</c:if></td>

							<td>${l.o_date}</td>

							<td><c:if test="${l.o_state == 0}">
									<b style="color: blue;">결제 완료</b>
								</c:if> <c:if test="${l.o_state == 1}">
									<b style="color: red;">출고 준비</b>
								</c:if> <c:if test="${l.o_state == 2}">
									<b style="color: green;">출고 완료</b>
								</c:if>
								<c:if test="${l.o_state == 3}">
									<b style="color: green;">교환 접수</b>
								</c:if></td>
							<td><c:if test="${l.o_state eq 2 }">
									<button
										onclick="location.href='./AskExchange.do?o_no=${l.o_no}'">교환신청</button>
								</c:if></td>
						</tr>
					</c:forEach>
				</table>

				<br> <br> <br> <br>

			</main>
		</div>
	</div>
	<footer>
		<div id="footer">
			<div id="sns">
				<p>
					<img alt="인스타그램" src="./resources/images/instargram.png"
						title="인스타그램">
				</p>
				<p>
					<img alt="페이스북" src="./resources/images/facebook.png" title="페이스북">
				</p>
				<p>
					<img alt="네이버블로그" src="./resources/images/naver.png"
						title="네이버블로그">
				</p>
			</div>
			<div id="law">
				<span id="userLaw"><strong>개인정보처리방침</strong></span><span
					id="useLaw">이용약관</span>
			</div>
			<div id="copyright">&copy; 2021 Spring.B</div>
		</div>
		<div id="view">
			<div class="userLaw">
				<h4>Spring.B 서비스 개인정보 처리방침</h4>
				<p>Spring.B(이하 "회사"라 합니다)는 회사가 제공하는 Spring.B 서비스(이하 "서비스"라 합니다)
					회원의 개인정보보호를 매우 중요시하며, 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』등 개인정보와 관련된 법령
					상의 개인정보보호규정을 준수하고 있습니다. 회사는 아래와 같이 개인정보처리방침을 명시하여 회원이 회사에 제공한
					개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치를 취하는지 알려드립니다. 회사의
					서비스 개인정보처리방침은 정부의 법률 및 지침의 변경과 당사의 약관 및 내부 정책에 따라 변경될 수 있으며 이를
					개정하는 경우 회사는 변경사항에 대하여 즉시 서비스 화면에 게시합니다. 회원님께서는 사이트 방문 시 수시로 확인하시기
					바랍니다.</p>
				<p>
					1. 오늘의집은 이용하는 서비스의 형태에 따라 다음과 같은 개인정보를 수집 및 이용∙제공∙파기하고 있습니다.<br>
					① 개인정보의 수집 ∙ 이용 목적 및 항목 회사가 제공하는 서비스는 별도의 회원가입 절차 없이 자유롭게 컨텐츠에 접근할
					수 있습니다. 회사의 회원제 서비스 이용을 위해 수집 ∙ 이용하는 개인정보는 다음의 목적 이외의 용도로는 이용되지
					않으며, 목적 변경 시 별도의 동의를 받는 등 필요한 조치를 이행합니다.
				</p>
				<p>
					2. 서비스의 제공 또는 법령에 정해진 책임의 준수를 위하여 회사가 보관하고 있는 개인정보가 제3자에게 수집 목적 범위
					내에서 제공될 수 있습니다.<br /> ① 회사는 이용자의 개인정보를 명시한 범위 내에서만 처리하며, 정보주체의 동의,
					법률의 특별한 규정에 해당하는 경우에만 개인정보를 제 3 자에게 제공합니다 ② 회사는 다음과 같이 개인정보를 제 3
					자에게 제공하고 있습니다.
				</p>
				<p>
					3. 이용자의 의무<br> ① 이용자는 본인의 개인정보를 안전하게 지키기 위해 개인정보보호에 관한 법률을
					준수할 의무가 있습니다. ② 이용자는 자신의 개인정보를 안전하게 보호할 의무가 있으며, 회사는 이용자 개인의 부주의로
					인해 발생된 일에 대해서는 책임을 지지 않습니다. 따라서 이용자는 자신의 개인정보보호를 위하여 ID 및 비밀번호를
					철저히 관리하고 주기적으로 변경하는 등의 최선의 노력을 다할 의무가 있습니다. ③ 이용자는 본인의 개인정보를 최신의
					상태로 정확하게 입력하고 유지할 의무가 있습니다. 이용자의 부정확한 정보 입력으로 인하여 발생하는 문제의 책임은 이용자
					본인에게 있습니다. ④ 이용자는 타인의 개인정보를 도용하여 회원가입 또는 서비스 이용 시 회원자격 상실과 함께
					개인정보에 관한 법률에 의거하여 처벌될 수 있습니다. ⑤ 이용자는 타인의 개인정보를 침해하거나 유출하지 않을 의무도
					가지고 있습니다. 서비스 이용 중 다른 이용자에 대해 알게 된 개인정보를 언급하거나, 유출할 경우 개인정보 관련 법령에
					의거하여 처벌될 수 있습니다.
				</p>
				<p>개인정보가 침해 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다. ▶ 개인정보 침해신고센터
					(한국인터넷진흥원 운영) : (국번없이) 118 / privacy.kisa.or.kr ▶ 대검찰청 사이버범죄수사단 :
					(국번없이) 1301 / www.spo.go.kr ▶ 경찰청 사이버안전국 : (국번없이) 182 /
					www.cyber.go.kr ▶ 전자거래분쟁조정위원회 (https://www.ecmc.or.kr / 1661-5714)
				</p>
			</div>
			<div class="useLaw">
				<h4>Spring.B 서비스 이용 약관</h4>
				<p>제 1조 (목적) Spring.B 서비스 이용약관(이하 “약관”이라 합니다)은 주식회사 Spring.B(이하
					“회사”라 합니다)가 제공하는 서비스와 관련하여 회사와 이용 고객(또는 회원) 간에 서비스의 이용 조건 및 절차,
					회사와 회원 간의 권리, 의무 및 책임 사항 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
				<p>제 2조 (용어) 본 약관에서 사용하는 용어의 정의는 다음 각 호와 같으며, 정의되지 않은 용어에 대한
					해석은 관계법령 및 서비스별 안내에서 정하는 바에 따릅니다. 1. 서비스: 이용 고객 또는 회원이 PC, 휴대형
					단말기, 태블릿PC 등 각종 유무선 기기 또는 프로그램을 통하여 이용할 수 있도록 회사가 제공하는 서비스를 말합니다.
				</p>
				<p>
					제3조 (약관의 효력 및 변경)<br> ① 본 약관은 회원이 쉽게 알 수 있도록 서비스 내 또는 연결화면을
					통하여 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력이 발생합니다.<br> ② 회사는 약관의 규제에
					관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관계법령에 위배되지 않는 범위 내에서 본 약관을 개정할
					수 있습니다.<br> ③ 회사는 약관을 개정할 경우 그 개정이유 및 적용일자를 명시하여 현행 약관과 함께
					적용일자 7일전부터 적용일 전일까지 제1항의 방법으로 공지합니다. 다만, 회원의 권리 또는 의무에 관한 중요한 규정의
					변경은 최소한 30일전에 공지하고 개정약관을 회원이 등록한 E-mail로 발송하여 통지합니다.<br> ④
					회사가 제3항에 따라 개정약관을 공지 또는 통지하였음에도 불구하고 회원이 명시적으로 거부의사를 표시하지 아니하는 경우
					회원이 개정약관에 동의한 것으로 봅니다.<br> ⑤ 회원은 변경된 약관에 동의하지 아니하는 경우 서비스의
					이용을 중단하고 이용계약을 해지할 수 있습니다.<br> ⑥ 본 약관에 동의하는 것은 서비스를 정기적으로
					방문하여 약관의 변경사항을 확인하는 것에 동의함을 의미합니다. 변경된 약관에 대한 정보를 알지 못하여 발생하는 회원의
					피해에 대하여 회사는 책임을 지지 않습니다.
				</p>
				<p>
					제8조 (서비스의 이용)<br> ① 회사는 회원의 이용신청을 승낙한 때부터 서비스를 개시합니다. ② 회사의
					업무상ㆍ기술상의 장애로 인하여 서비스를 개시하지 못하는 경우에는 서비스에 공지하거나 회원에게 이를 통지합니다. ③
					서비스의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 회사의 업무상ㆍ기술상 또는 서비스 운영정책상 서비스가
					일시 중지될 수 있습니다. 이러한 경우 회사는 사전 또는 사후에 이를 공지합니다. ④ 회사는 서비스를 일정범위로
					분할하여 각 범위 별로 이용 가능한 시간을 별도로 정할 수 있으며 이 경우 그 내용을 공지합니다. ⑤ 회사는 서비스
					내의 개별서비스에 대한 별도의 약관을 둘 수 있으며, 개별서비스에서 별도로 적용되는 약관에 대한 동의는 회원이
					개별서비스를 최초로 이용할 경우 별도의 동의절차를 거치게 됩니다.
				</p>
				<p>
					제17조 (회원정보의 보호 및 이용)<br> ① 회사는 적법하고 공정한 수단에 의하여 이용계약의 성립 및
					이행에 필요한 최소한의 범위 내에서 개인정보처리방침에 따라 회원의 회원정보를 수집합니다. ② 회사의 개인정보처리방침은
					회사에 연동된 다른 서비스(회사가 운영하지 않는 서비스를 말합니다. 이하 같습니다)에는 적용되지 않습니다. ③ 회사는
					통신비밀보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관계법령에 따라 행정기관이나 수사기관 등에서 회원의
					회원정보의 열람이나 제출을 요청하는 경우에는 이를 제공할 수 있습니다. ④ 회사는 회원의 귀책사유로 인해 노출된
					회원정보에 대해서 일체의 책임을 부담하지 않습니다. ⑤ 회사는 회원정보의 처리 및 관리 등의 업무를 스스로 수행함을
					원칙으로 하나, 필요한 경우 이러한 업무의 일부 또는 전부를 회사가 선정한 회사에 위탁할 수 있으며, 회원정보의 처리
					및 관리 등에 관한 업무를 위탁하는 경우에는 개인정보처리방침을 통하여 공지합니다. ⑥ 회원이 이용계약 체결과정에서
					회사에 제공한 회원정보에 대한 이용 또는 제공에 대한 동의를 철회하고자 하는 경우에는 개인정보처리방침에서 정한 바에
					따르며, 회원이 이러한 동의를 철회하는 경우 서비스 이용계약은 자동으로 해지됩니다.
				</p>
			</div>
		</div>
		<div id="full"></div>
	</footer>
</body>
</html>

