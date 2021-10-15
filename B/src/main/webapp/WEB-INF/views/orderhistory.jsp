<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>주문배송내역 조회 | 가구</title>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />

<!-- <link rel="stylesheet" href="./resources/css/base.css">  -->
<link rel="stylesheet" href="./resources/css/mypage.css">
<link rel="stylesheet" href="./resources/css/invoice.css">


<style>

/* add 슬라이드 이미지 */
.slider {
	width: 800px;
	height: 150px;
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
	left: 500px;
	transition-delay: 1s; /* 새 슬라이드가 이동해 오는 동안 이전 슬라이드 이미지가 배경이 보이도록 지연 */
	padding: 0;
	margin: 0;
}

.bullets {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	bottom: 5px;
	z-index: 2;
}

.bullets label {
	display: inline-block;
	border-radius: 50%;
	background-color: rgba(0, 0, 0, 0.55);
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
	font-size: 12px;
	color: #555; 0
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
								href="./orderhistory.do">주문배송내역 조회</a></li>
							<li class="sideMenu__item"><a href="">최근 본 상품</a></li>
							<li class="sideMenu__item"><a href="">쿠폰 / 적립금 조회</a></li>
							<li class="sideMenu__item"><a href="">상품 문의</a></li>
							<li class="sideMenu__item"><a href="">1:1 문의</a></li>
						</ul>
					</div>
					<div class="sideMenu__block">
						<h3>회원 정보</h3>
						<ul class="sideMenu__items">
							<li class="sideMenu__item"><a href="./myinfo.do">회원 정보 조회</a></li>
							<li class="sideMenu__item"><a href="">주소록</a></li>
							<li class="sideMenu__item"><a href="./myinfoUpdatePW.do">비밀번호 변경</a></li>
							<li class="sideMenu__item sideMenu__item--active"><a href="./myinfoDelete.do">회원 탈퇴</a></li>
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
				<h1 align="left">주문배송내역 조회</h1>
				
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
						<li><img src="./resources/images/slide12.jpg"></li>
						<li><img src="./resources/images/slide13.jpg"></li>
						<li><img src="./resources/images/slide14.jpg"></li>
						<li><img src="./resources/images/slide15.jpg"></li>

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

				<br>
				<br>
				<h3 align="left">주문 리스트</h3>
				<br>
				<br>
				<table>
					<tr>
						<th>no</th>
						<th>제품명</th>
						<th>제품 이미지</th>
						<th>수량</th>
						<th>가격</th>
						<th>주문 날짜</th>
						<th>현재 상태</th>
					</tr>
					<c:forEach items="${list }" var="l">
						<tr>
							<td>${l.p_no}</td>
							<td>${l.p_title}</td>
							<td><img
								src="https://blogger.googleusercontent.com/img/a/${l.p_img}"
								style="width: 150px; height: 150px;"></td>
							<td>${l.cnt}</td>
							<td>${l.p_price}</td>
							<td>${l.p_date}</td>

							<td><c:if test="${l.o_state == 0}">
									<b style="color: blue;">결제 완료</b>
								</c:if> <c:if test="${l.o_state == 1}">
									<b style="color: red;">출고 준비</b>
								</c:if> <c:if test="${l.o_state == 2}">
									<b style="color: green;">출고 완료</b>
								</c:if></td>
						</tr>
					</c:forEach>
				</table>

				<br> <br> <br> <br>

				<button class="snip1535" onclick="location.href='index.do'">메인
					화면으로</button>
				<br> <br>
			</main>
		</div>
		<footer id="footer-space"></footer>
	</div>
</body>
</html>
