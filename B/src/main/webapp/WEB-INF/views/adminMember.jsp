<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 | 가구</title>
<link rel="stylesheet" href="./resources/css/base.css">
<link rel="stylesheet" href="./resources/css/admin.css">
<style>
    .memberList-container{

    }

    .memberList{

    }

    th:first-child{
      width: auto;
    }

    td button{
      background: transparent;
      color: red;
      font-size: 11pt;
      font-style: italic;
      font-weight: 500;
      border-radius: 5px;
    }

    td button:hover{
      background: rgba(247,164,164,0.36);
    }

  </style>
</head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	function deleteMember(id) {

		if (confirm("해당 계정을 삭제하시겠습니까?")) {
			alert("해당 계정이 삭제되었습니다.");
			var form = document.createElement("form");
			//form.setAttribute("id", "form");
			//form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "post"); // Get 또는 Post 입력
			form.setAttribute("action", "./adminDeleteMember.do");

			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "id");
			hiddenField.setAttribute("value", id);
			form.appendChild(hiddenField);

			document.body.appendChild(form);
			//alert(id);
			form.submit();

			//document.getElementById("form").remove();
		} else {
			alert("취소되었습니다.");
			location.href = "./adminMember.do";
		}

	}
	function linkPage(pageNo) {
		location.href = "./adminMember.do?pageNo="
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
		form.setAttribute("action", "./adminMember.do");

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
<body>
<!--admin 공통 부분-->
<div id="layout-container">
  <header id="admin-header"></header>
  <div id="admin-main-container">
    <nav id="admin-sideMenu">
      <div class="sideMenu__block-container">
        <ul class="sideMenu__items">
          <li class="sideMenu__item">
            <div class="sideMenu-container">
              <div><img src="./resources/images/setting.png"></div>
              <div><a href="">홈으로</a></div>
            </div>
          </li>
          <li class="sideMenu__item">
            <div class="sideMenu-container">
              <div><img src="./resources/images/delivery.png"></div>
              <div><a href="">주문 관리</a></div>
            </div>
            <div class="sideMenu-sub-container">
              <ul class="sideMenu__subItems">
                <li class="sideMenu__subItem"><a href="">주문 목록</a></li>
                <li class="sideMenu__subItem"><a href="">교환 관리</a></li>
                <li class="sideMenu__subItem"><a href="">환불 관리</a></li>
              </ul>
            </div>
          </li>
          <li class="sideMenu__item">
            <div class="sideMenu-container">
              <div><img src="./resources/images/furniture.png"></div>
              <div><a href="">상품 관리</a></div>
            </div>
            <div class="sideMenu-sub-container">
              <ul class="sideMenu__subItems">
                <li class="sideMenu__subItem"><a href="">상품 목록</a></li>
                <li class="sideMenu__subItem"><a href="">상품 등록</a></li>
                <li class="sideMenu__subItem"><a href="">쿠폰 등록</a></li>
              </ul>
            </div>
          </li>
          <li class="sideMenu__item sideMenu__item--active">
            <div class="sideMenu-container">
              <div><img src="./resources/images/user.png"></div>
              <div><a href="./adminMember.do">고객 관리</a></div>
            </div>
            <div class="sideMenu-sub-container">
              <ul class="sideMenu__subItems sideMenu__subItems--active">
                <li class="sideMenu__subItem sideMenu__subItem--active"><a href="./adminMember.do">회원 목록</a></li>
              </ul>
            </div>
          </li>
          <li class="sideMenu__item">
            <div class="sideMenu-container">
              <div><img src="./resources/images/support.png"></div>
              <div><a href="">고객 응대</a></div>
            </div>
            <div class="sideMenu-sub-container">
              <ul class="sideMenu__subItems">
                <li class="sideMenu__subItem"><a href="">상품 문의 목록</a></li>
                <li class="sideMenu__subItem"><a href="">1:1 문의 목록</a></li>
                <li class="sideMenu__subItem"><a href="">자주 묻는 질문 관리</a></li>
                <li class="sideMenu__subItem"><a href="">리뷰 목록</a></li>
              </ul>
            </div>
          </li>
          <li class="sideMenu__item">
            <div class="sideMenu-container">
              <div><img src="./resources/images/browser.png"></div>
              <div><a href="./adminLog.do">사이트 관리</a></div>
            </div>
            <div class="sideMenu-sub-container">
              <ul class="sideMenu__subItems">
                <li class="sideMenu__subItem"><a href="./adminLog.do">로그 조회</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </div>
    </nav>
    <main>
      <!--admin 공통 부분 끝-->
      <div class="admin-title">
        <h1>회원 목록</h1>
      </div>
      <div class="period-search-box">
      <form action="./adminMember.do" method="get">
        <label>
          <p>가입 기간</p>
          <input type="text" id="datepicker_start" name="startDay"<c:if test="${startDay ne null }">value=${startDay }</c:if>> ~
          <input type="text" id="datepicker_end" readonly="readonly" name="endDay" <c:if test="${endDay ne null }">value=${endDay }</c:if>>
        </label>
        <button class="search-button" type="submit">조회</button>
        </form>
      </div>
      <div class="selects-container">
        <div class="keyword-search-box">
          <form action="./adminMember.do" method="get">
          <label for="keyword-search__word">
            <p>키워드 검색</p>
          </label>
          <div class="keyword-search__bar">
            <select id="keyword-search__column" name="searchName">
              <option value="m_id"<c:if test="${searchName eq 'm_id'}">selected="selected"</c:if>>ID</option>
			<option value="m_name"<c:if test="${searchName eq 'm_name'}">selected="selected"</c:if>>이름</option>
			<option value="m_email"<c:if test="${searchName eq 'm_email'}">selected="selected"</c:if>>이메일</option>
            </select>
            <input type="search" name="search" id="keyword-search__word" <c:if test="${search ne null }">value=${search }</c:if>>
          </div>
          <button class="search-button" type="submit">검색</button>
          </form>
        </div>
        <div class="sort-box">
          <select name="searchName" onchange="order()" id="order">
            <option value="">선택</option>
			<option value="m_no"<c:if test="${order eq 'm_no'}">selected="selected"</c:if>>회원번호 순</option>
			<option value="m_date"<c:if test="${order eq 'm_date'}">selected="selected"</c:if>>가입일 순</option>
          </select>
        </div>
      </div>
      <c:choose>
	<c:when test="${fn:length(adminMember) gt 0 }">
      <div class="memberList-container">
        <table class="list-table memberList">
          <thead>
          <tr>
            <th scope="col">회원 번호</th>
            <th scope="col">ID</th>
            <th scope="col">이름</th>
            <th scope="col">이메일</th>
            <th scope="col">가입일</th>
            <th scope="col">삭제</th>
          </tr>
          </thead>
          <tbody>
          <!--회원 목록 출력 / 반복문 사용-->
          <c:forEach items="${adminMember }" var="am">
          <tr>
				<td>${am.m_no}</td>
				<td>${am.m_id}</td>
				<td>${am.m_name}</td>
				<td>${am.m_email}</td>
				<td>${am.m_date}</td>
				<td><button type="submit" onclick="deleteMember('${am.m_id}')">삭제</button></td>
			</tr>
		</c:forEach>
          <!--회원 목록 출력 끝-->
          </tbody>
        </table>
        <div class="paging memberList__paging">
          <!--페이징 출력-->
          <ui:pagination paginationInfo="${paginationInfo }" type="text"
		jsFunction="linkPage" />
        </div>
      </div>
      </c:when>
		<c:otherwise>
			<h2>출력할 글이 없습니다.</h2>
		</c:otherwise>
	</c:choose>
    </main>
  </div>
  <footer id="admin-footer"></footer>
</div>
</body>
</html>