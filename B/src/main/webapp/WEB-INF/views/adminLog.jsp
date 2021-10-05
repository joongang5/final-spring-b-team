<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>로그리스트</title>
<!-- <style type="text/css">
table {
	margin: 0 auto;
	width: 100%;
	height: 500px;
	border-collapse: collapse;
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

#title {
	text-align: left;
}

#paging {
	text-align: center;
	margin: 10px auto;
}

#paging img {
	vertical-align: middle;
}

#paging a {
	display: inline-block;
	padding: 0 3px;
}

#paging a:hover {
	background-color: #EAFAF1;
	border-color: #eee;
	box-shadow: 3px 3px 3px #7DCEA0;
}
</style> -->
<script type="text/javascript">
function linkPage(pageNo) {
	location.href = "./adminLog.do?pageNo="
			+ pageNo
			+ "<c:if test="${search ne null}">&searchName=${searchName}&search=${search}</c:if>" +
			"<c:if test="${startDay ne null && endDay ne null}">&startDay=${startDay}&endDay=${endDay}</c:if>"+
			"<c:if test="${order ne null}">&order=${order}</c:if>";
}
	
	$(function() {
		//모든 datepicker에 대한 공통 옵션 설정
        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
        });

        //input을 datepicker로 선언
       	$("#datepicker_start").datepicker();
		$("#datepicker_end").datepicker();
        
        //From의 초기값을 오늘 날짜로 설정
        $('#datepicker_start').datepicker('setDate', 'today', selected); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        //To의 초기값을 내일로 설정
        $('#datepicker_end').datepicker('setDate', 'today', selected); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)

	});
	
	function order() {
		var order = document.getElementById("order").value;
		var form = document.createElement("form");
		//alert(order);
		
		form.setAttribute("method", "get"); // Get 또는 Post 입력
		form.setAttribute("action", "./adminLog.do");

		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "order");
		hiddenField.setAttribute("value", order);
		form.appendChild(hiddenField);

		document.body.appendChild(form);
		//alert(order);
		form.submit();
		
	}
</script>
</head>
<body>
	<a href="./adminMember.do">회원관리</a>
	<a href="./adminLog.do">로그관리</a>
	<h1>로그관리</h1> 
	<h2>${totalCount }개 로그가 있습니다.</h2>

	<c:if test="${searchName ne null }">
		<h2>
			검색조건 : ${searchName } / 검색어 : ${search }
			<button onclick="location.href='./adminLog.do'">검색초기화</button>
		</h2>
	</c:if>
	<hr>
	<form action="./adminLog.do" method="get">
	<p>입력기간 : <input type="text" id="datepicker_start" readonly="readonly" name="startDay"<c:if test="${startDay ne null }">value=${startDay }</c:if>> ~ <input type="text" id="datepicker_end" readonly="readonly" name="endDay"<c:if test="${endDay ne null }">value=${endDay }</c:if>> <button type="submit">조회</button></p>
	</form>
	<form action="./adminLog.do" method="get">
	키워드 검색 : 
		<select name="searchName">
			<option value="ip"
				<c:if test="${searchName eq 'ip'}">selected="selected"</c:if>>IP</option>
			<option value="id"
				<c:if test="${searchName eq 'id'}">selected="selected"</c:if>>아이디</option>
			<option value="target"
				<c:if test="${searchName eq 'target'}">selected="selected"</c:if>>Target</option>
			<option value="content"
				<c:if test="${searchName eq 'content'}">selected="selected"</c:if>>내용</option>
		</select> <input type="text" name="search"<c:if test="${search ne null }">value=${search }</c:if>>
		<button>검색</button>
	</form>
	<br>
	<select name="searchName" onchange="order()" id="order">
			<option value="">선택</option>
			<option value="l_no"<c:if test="${order eq 'l_no'}">selected="selected"</c:if>>로그번호 순</option>
			<option value="l_date"<c:if test="${order eq 'l_date'}">selected="selected"</c:if>>입력일 순</option>
		</select>
		
	<c:choose>
		<c:when test="${fn:length(list) gt 0 }">
			<table>
				<tr>
					<th>로그 번호</th>
					<th>입력일</th>
					<th>IP</th>
					<th>아이디</th>
					<th>Target</th>
					<th>내용</th>
				</tr>
				<c:forEach items="${list }" var="l">
					<tr>
						<td>${l.l_no }</td>
						<td>${l.l_date }</td>
						<td>${l.l_ip }</td>
						<td>${l.m_id }</td>
						<td>${l.l_target }</td>
						<td>${l.l_data }</td>
					</tr>
				</c:forEach>
			</table>
			<!-- 페이징은 여기에 -->
			<ui:pagination paginationInfo="${paginationInfo}" type="text"
				jsFunction="linkPage" />
		</c:when>
		<c:otherwise>
			<h2>출력할 글이 없습니다.</h2>
		</c:otherwise>
	</c:choose>
</body>
</html>