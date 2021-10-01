<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>���� ����</title>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<style>
p {
	margin: 20px 0px;
}

/* Default */
input[type=text], input[type=password] {
	font-family: "Malgun Gothic", "���� ���", Dotum, "����", Arial, sans-serif
}

* {
	margin: 0;
	padding: 0;
	font-family: "Malgun Gothic", "���� ���", Dotum, "����", Arial, sans-serif
}

body {
	font-size: 12px;
	color: #555;
	background: transparent;
	-webkit-user-select: none;
	-moz-user-select: none;
	-webkit-text-size-adjust: none;
	-moz-text-size-adjust: none;
	-ms-text-size-adjust: none
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
	padding: 20px 10px 20px 35px;
	font-size: 14px;
	font-weight: bold;
	text-align: left;
	vertical-align: top;
	border: none;
	background: #e6e6e6
}

.searchBox tbody td {
	padding: 12px 10px 12px 25px;
	border: none;
	background-color: #efefef
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
	text-align: center
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
	text-align: center;
	line-height: 25px;
	text-decoration: none;
	cursor: pointer;
	background: #a5b0b6
}

.searchDate li .chkbox2.on label {
	background: #ec6a6a
}

.demi {
	display: inline-block;
	margin: 0 1px;
	vertical-align: middle
}

.inpType {
	padding-left: 6px;
	height: 24px;
	line-height: 24px;
	border: 1px solid #dbdbdb
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
<!-- datepicker �ѱ���� -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

<script>
	$(document).ready(function() {

		//datepicker �ѱ���� ����ϱ� ���� ����
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

		//������.
		/*$('#searchStartDate').datepicker("option","onClose", function( selectedDate ) {    
		    // ������ datepicker�� ������
		    // �������� �����Ҽ��ִ� �ּ� ��¥(minDate)�� ������ �����Ϸ� ����
		    $("#searchEndDate").datepicker( "option", "minDate", selectedDate );
		    $(".searchDate").find(".chkbox2").removeClass("on");
		});
		 */

		//������.
		/*$('#searchEndDate').datepicker("option","onClose", function( selectedDate ) {    
		    // ������ datepicker�� ������
		    // �������� �����Ҽ��ִ� �ִ� ��¥(maxDate)�� ������ �����Ϸ� ���� 
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

		// �������� ������ ���� ��¥ �������� ���ϵ��� ��Ȱ��ȭ
		$("#searchEndDate").datepicker("option", "minDate", startDate);

		// �������� ������ ���� ��¥ �������� ���ϵ��� ��Ȱ��ȭ
		$("#searchStartDate").datepicker("option", "maxDate", endDate);

	}
</script>

</head>
<body>
	<h1>���ų���</h1>
	<br>

	<h3>�����Ȳ</h3>
	<br>
	<table>
		<tr>
			<th>���� �Ϸ�</th>
			<th rowspan="3">��</th>
			<th>��� �غ�</th>
			<th rowspan="3">��</th>
			<th>��� �Ϸ�</th>
		</tr>
		<tr>
			<td>0</td>
			<td>2</td>
			<td>0</td>
		</tr>
	</table>
	<br>
	<table class="searchBox">
		<caption>��ȸ</caption>
		<colgroup>
			<col width="123px">
			<col width="*">
		</colgroup>
		<tbody>
			<tr>
				<th>��ȸ�Ⱓ</th>
				<td>
					<ul class="searchDate">
						<li><span class="chkbox2"> <input type="radio"
								name="dateType" id="dateType1" onclick="setSearchDate('0d')" />
								<label for="dateType1">����</label>
						</span></li>
						<li><span class="chkbox2"> <input type="radio"
								name="dateType" id="dateType2" onclick="setSearchDate('3d')" />
								<label for="dateType2">3��</label>
						</span></li>
						<li><span class="chkbox2"> <input type="radio"
								name="dateType" id="dateType3" onclick="setSearchDate('1w')" />
								<label for="dateType3">1��</label>
						</span></li>
						<li><span class="chkbox2"> <input type="radio"
								name="dateType" id="dateType4" onclick="setSearchDate('2w')" />
								<label for="dateType4">2��</label>
						</span></li>
						<li><span class="chkbox2"> <input type="radio"
								name="dateType" id="dateType5" onclick="setSearchDate('1m')" />
								<label for="dateType5">1����</label>
						</span></li>
						<li><span class="chkbox2"> <input type="radio"
								name="dateType" id="dateType6" onclick="setSearchDate('3m')" />
								<label for="dateType6">3����</label>
						</span></li>
						<li><span class="chkbox2"> <input type="radio"
								name="dateType" id="dateType7" onclick="setSearchDate('6m')" />
								<label for="dateType7">6����</label>
						</span></li>
					</ul>

					<div class="clearfix">
						<!-- ������ -->
						<span class="dset"> <input type="text"
							class="datepicker inpType" name="searchStartDate"
							id="searchStartDate"> <a href="#none"
							class="btncalendar dateclick">�޷�</a>
						</span> <span class="demi">~</span>
						<!-- ������ -->
						<span class="dset"> <input type="text"
							class="datepicker inpType" name="searchEndDate"
							id="searchEndDate"> <a href="#none"
							class="btncalendar dateclick">�޷�</a>
						</span>
						<button type="button" id="search">��ȸ</button>
					</div>
				</td>
			</tr>
		<tbody>
	</table>
	<br>
	<h3>�ֹ� ����Ʈ</h3>
	<table>
		<tr>
			<th>no</th>
			<th>��ǰ��</th>
			<th>��ǰ �̹���</th>
			<th>����</th>
			<th>����</th>
			<th>���� ��¥</th>
			<th>���� ����</th>
		</tr>
		<c:forEach items="${list }" var="l">
			<tr>
				<td>${l.p_no}</td>
				<td>${l.p_title}</td>
				<td>${l.p_img }</td>
				<td>${l.cnt}</td>
				<td>${l.p_price}</td>
				<td>${l.p_date}</td>
				<td>��� �غ�</td>
			</tr>
		</c:forEach>
	</table>



	<br>
	<div class="container">
		<ul class="pagination justify-content-center">
			<div class="row">
				<div class="col">
					<p>
						<strong></strong>
					</p>
					<ul class="pagination pagination-sm">
						<li class="page-item"><a class="text-dark page-link" href="#">����</a></li>
						<li class="page-item"><a class="text-dark page-link" href="#">1</a></li>
						<li class="page-item"><a class="text-dark page-link" href="#">2</a></li>
						<li class="page-item"><a class="text-dark page-link" href="#">3</a></li>
						<li class="page-item"><a class="text-dark page-link" href="#">4</a></li>
						<li class="page-item"><a class="text-dark page-link" href="#">5</a></li>
						<li class="page-item"><a class="text-dark page-link" href="#">����</a></li>
					</ul>
				</div>
			</div>
		</ul>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

	<button onclick="move()">���� ȭ������</button>


</body>
</html>