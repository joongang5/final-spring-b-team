<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>

<link rel="stylesheet"href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<meta charset="UTF-8">
 <title>관리자 페이지 | Spring.B</title>
  <link rel="stylesheet" href="./resources/css/base.css">
  <link rel="stylesheet" href="./resources/css/admin.css">
  <style>
    .change-orderState-box{

    }


    .change-orderState-box label{

    }

    #change-orderState {
      background-color: #eeded5;
      width: 115px;
      padding: 7px 14px;
      border-radius: 8px;
      background-position-x: 94%;
      background-position-y: center;
      margin-right: 10px;
    }

      .orderList-container{
        margin-top: 25px;
      }

    .orderList{margin: auto;}

    .orderList th:nth-child(5){

    }

    .orderList th:nth-child(8){

    }

    #sort__by-orderState{

    }

    .orderList td{

    }

    .orderList__paging {

    }

  </style>
<script type="text/javascript">
$(document).ready(function(){
$(".checkbox").click(function(){
	var arr = []
	$(".checkbox").each(function(){
		if($(this).is(":checked"))
		arr.push($(this).val())
		
		
	})

	 $('input[name=modify]').attr('value',arr)
		
})
})


	function linkPage(pageNo) {
		location.href = "./admin_orderList.do?pageNo="
				+ pageNo
				+ "<c:if test="${search ne null}">&searchName=${searchName}&search=${search}</c:if>"
				+ "<c:if test="${startDay ne null && endDay ne null}">&startDay=${startDay}&endDay=${endDay}</c:if>";
	}
	

	$(function() {
		//모든 datepicker에 대한 공통 옵션 설정
		$.datepicker
				.setDefaults({
					dateFormat : 'yy-mm-dd' //Input Display Format 변경
					,
					showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
					,
					showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
					,
					changeYear : true //콤보박스에서 년 선택 가능
					,
					changeMonth : true //콤보박스에서 월 선택 가능                
					,
					showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
					,
					buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
					,
					buttonImageOnly : true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
					,
					buttonText : "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
					,
					yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
					,
					monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
							'9', '10', '11', '12' ] //달력의 월 부분 텍스트
					,
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
					,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
					,
					dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
							'토요일' ] //달력의 요일 부분 Tooltip 텍스트
					,
					minDate : "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
					,
					maxDate : "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
				});
		

		//input을 datepicker로 선언
		$("#datepicker_start").datepicker();
		$("#datepicker_end").datepicker();

		//From의 초기값을 오늘 날짜로 설정
		$('#datepicker_start').datepicker('setDate', 'today', selected); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		//To의 초기값을 내일로 설정
		$('#datepicker_end').datepicker('setDate', 'today', selected); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)

	});

	
	
	

</script>
</head>
<body>

<!--admin 공통 부분-->
  <header id="admin-header">
  <c:import url="/adminHeader.do"/>
  </header>
<div id="layout-container">
  <div id="admin-main-container">
    <nav id="admin-sideMenu">
      <div class="sideMenu__block-container">
        <ul class="sideMenu__items">
          <li class="sideMenu__item">
            <div class="sideMenu-container">
              <div><img src="./resources/images/setting.png"></div>
              <div><a href="./index.do">홈으로</a></div>
            </div>
          </li>
          <li class="sideMenu__item sideMenu__item--active">
            <div class="sideMenu-container">
              <div><img src="./resources/images/delivery.png"></div>
              <div><a href="./admin_orderList.do">주문 관리</a></div>
            </div>
            <div class="sideMenu-sub-container">
              <ul class="sideMenu__subItems sideMenu__subItems--active">
                <li class="sideMenu__subItem sideMenu__subItem--active"><a href="./admin_orderList.do">주문 목록</a></li>
                <li class="sideMenu__subItem"><a href="./admin_exchange.do">교환 관리</a></li>
                <li class="sideMenu__subItem"><a href="">환불 관리</a></li>
              </ul>
            </div>
          </li>
          <li class="sideMenu__item">
            <div class="sideMenu-container">
              <div><img src="./resources/images/furniture.png"></div>
              <div><a href="./product.do">상품 관리</a></div>
            </div>
            <div class="sideMenu-sub-container">
              <ul class="sideMenu__subItems">
                <li class="sideMenu__subItem"><a href="./product.do">상품 목록</a></li>
                <li class="sideMenu__subItem"><a href="./registerProduct.do">상품 등록</a></li>
                <li class="sideMenu__subItem"><a href="">쿠폰 등록</a></li>
              </ul>
            </div>
          </li>
          <li class="sideMenu__item">
            <div class="sideMenu-container">
              <div><img src="./resources/images/user.png"></div>
              <div><a href="./adminMember.do">고객 관리</a></div>
            </div>
            <div class="sideMenu-sub-container">
              <ul class="sideMenu__subItems">
                <li class="sideMenu__subItem"><a href="./adminMember.do">회원 목록</a></li>
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
        <h1>주문 목록</h1>
      </div>
      
     
      
      <div class="period-search-box">
      	<form action="./admin_orderList.do" method="get">
        	<label>
          	<p>주문일 검색</p>
         	 <input type="date" id="datepicker_start" readonly="readonly" name="startDay" <c:if test="${startDay ne null }">value=${startDay }</c:if>> ~
           	 <input type="date"	id="datepicker_end" readonly="readonly"   name="endDay"   <c:if test="${endDay ne null }">value=${endDay }</c:if>>
			 </label>
			<button class="search-button" type="submit">조회</button>
       </form>
      		<button class="search-button" onclick="location.href='./admin_orderList.do'"> 초기화 </button>
      </div>
      
      <div class="keyword-search-box">
        <label for="keyword-search__word">
          <p>키워드 검색</p>
        </label>
         <form action="./admin_orderList.do" method="get">
        <div class="keyword-search__bar">
          <select id="keyword-search__column" name="searchName">
            <option value="pa_id"><c:if test="${searchName eq 'pa_id'}">selected="selected"</c:if>주문 번호</option>
            <option value="m_id"><c:if test="${searchName eq 'm_id'}">selected="selected"</c:if>주문자id</option>
            <option value="p_no"><c:if test="${searchName eq 'p_no'}">selected="selected"</c:if>상품 번호</option>
            <option value="p_title"><c:if test="${searchName eq 'p_title'}">selected="selected"</c:if>상품명</option>
          </select>
          

          <input type="search" id="keyword-search__word" name="search">
          	<c:if test="${search ne null }">value=${search }</c:if>
        </div>
          <button class="search-button">검색</button>
          </form>
      </div>
      		
      	 
      
        
      
      <form action="stateModify.do" method="post">
      <div class="change-orderState-box">
        <label>
          <p>선택한 주문</p>
          <select id="change-orderState" class="search-select" name="o_state" >
            <option value="0">결제 완료</option>
            <option value="1">출고 준비</option>
            <option value="2">출고 완료</option>
          </select>
          <input type="hidden" id="modify"  value="" name="modify">
        </label>
        <button type="submit" class="search-button">일괄 변경</button>
      </div>
      </form>
      <div class="orderList-container">
        <table class="list-table orderList">
          <thead>
            <tr>
              <th scope="col">선택</th>
              <th scope="col">대표상품번호</th>
              <th scope="col">주문 번호</th>
              <th scope="col">주문자</th>
              <th scope="col">주문일</th>
              <th scope="col">주문 내역</th>
              <th scope="col">합계</th>
              <th scope="col">결제 금액</th>
              <th scope="col">처리 상태</th>
            </tr>
          </thead>
          <tbody>
          <!--주문 목록 출력 / 반복문 사용-->
           <c:forEach items="${AdminOrderList }" var="ao">
            <tr>
              <td>
                <label>
                <input type="checkbox"  class="checkbox" value="${ao.pa_id}">
                <span class="checkMark"></span>
                </label>
              </td>
              <td>${ao.o_no}</td>
              <td>${ao.pa_id}</td>
              <td>${ao.m_name}(${ao.m_id})</td>
              <td>${ao.DAT}</td>
              <!--여기서 주문 내역은 간결하게 출력한다. ex) 상품 ooo 외 *개-->
              <td><a href="./admin_orderDetail.do?pa_id=${ao.pa_id }" ><c:if test="${ao.total_cnt gt 1}">${ao.p_title} 외 ${ao.total_cnt -1} 개</c:if>
              <c:if test="${ao.total_cnt eq 1}">${ao.p_title}</c:if></a></td>
              <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${ao.pa_amount }" />원</td>      
              <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${ ao.pa_amount - ao.pa_usePoint }" />원</td>
              <td><c:if test="${ao.o_state eq 2 }">출고 완료✔</c:if><c:if test="${ao.o_state eq 1 }">출고 준비📦</c:if> <c:if test="${ao.o_state eq 0 }">결제 완료💸</c:if>
              <c:if test="${ao.o_state eq 3 }">교환 접수🔄</c:if>
              </td>
            </tr>
           </c:forEach> 
          <!--주문 목록 출력 끝-->
          </tbody>
        </table>
        <div class="paging orderList__paging">
          <!--페이징 출력-->
			<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="linkPage" />
        </div>
      </div>
    </main>
  </div>
  <footer id="admin-footer"></footer>
</div>
</body>
</html>