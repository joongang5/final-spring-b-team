<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>관리자 페이지 | 가구</title>
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
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
  function exchanging(){
	 
	  var o_no = $('#o_no').val()
	  $.ajax({
			url : "exchanging.do",
			type : "post",
			data : {"o_no" : o_no},
			success : function(data) {
				
				alert("교환 신청이 접수되었습니다.")
				location.href="./admin_exchange.do"
				
			},

		})	
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
          <li class="sideMenu__item sideMenu__item--active">
            <div class="sideMenu-container">
              <div><img src="./resources/images/delivery.png"></div>
              <div><a href="">주문 관리</a></div>
            </div>
            <div class="sideMenu-sub-container">
              <ul class="sideMenu__subItem">
                <li class="sideMenu__subItem"><a href="">주문 목록</a></li>
                <li class="sideMenu__subItems sideMenu__subItems--active"><a href="">교환 관리</a></li>
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
          <li class="sideMenu__item">
            <div class="sideMenu-container">
              <div><img src="./resources/images/user.png"></div>
              <div><a href="">고객 관리</a></div>
            </div>
            <div class="sideMenu-sub-container">
              <ul class="sideMenu__subItems">
                <li class="sideMenu__subItem"><a href="">회원 목록</a></li>
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
              <div><a href="">사이트 관리</a></div>
            </div>
            <div class="sideMenu-sub-container">
              <ul class="sideMenu__subItems">
                <li class="sideMenu__subItem"><a href="">로그 조회</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </div>
    </nav>
    <main>
      <!--admin 공통 부분 끝-->
      <div class="admin-title">
        <h1>교환 신청 내역</h1>
      </div>
      <div class="keyword-search-box">
        <label for="keyword-search__word">
          <p>키워드 검색</p>
        </label>
        <div class="keyword-search__bar">
          <select id="keyword-search__column">
            <option>주문 번호</option>
            <option>주문자</option>
            <option>상품 번호</option>
            <option>상품명</option>
          </select>
          <input type="search" id="keyword-search__word">
        </div>
          <button class="search-button">검색</button>
      </div>
      <div class="change-orderState-box">
        <label>
          <p>선택한 주문</p>
          <select id="change-orderState" class="search-select">
            <option>결제 완료</option>
            <option>출고 준비</option>
          </select>
        </label>
        <button class="search-button">일괄 변경</button>
      </div>
      <div class="orderList-container">
        <table class="list-table orderList">
          <thead>
            <tr>
              <th scope="col">선택</th>
              <th scope="col">주문 번호</th>
              <th scope="col">주문자</th>
              <th scope="col">주문일</th>
              <th scope="col">주문 내역</th>
              <th scope="col">결제 금액</th>
              <th scope="col">결제 수단</th>
              <th scope="col">신청 사유</th>
              <th scope="col">
                <select id="sort__by-orderState">
                  <option>진행 상태</option>
                  <option>접수 대기</option>
                  <option>진행 중</option>
                  <option>완료</option>
                </select>
              </th>
              <th scope="col">수동 접수</th>
            </tr>
          </thead>
          <tbody>
          <!--주문 목록 출력 / 반복문 사용-->
          <c:forEach items="${exchange}" var="e">
            <tr>
              <td>
                <label>
                  <input type="checkbox">
                  <span class="checkMark"></span>
                </label>
              </td>
              <td>${e.pa_id }</td>
              <td>${e.m_name}(${e.m_id })</td>
              <td>${e.o_date}</td>
              <td>${e.p_title}</td>
              <td> <fmt:formatNumber type="number" maxFractionDigits="1" value="${e.pa_amount - e.pa_usePoint}" /> 원</td>
              <td>${e.pa_plan }</td>
              <td>
              	<c:if test="${e.e_reason eq 0}">불량</c:if>
              	<c:if test="${e.e_reason eq 1}">단순변심</c:if>
              </td>
              <td><c:if test="${e.e_state eq 0}">접수 대기</c:if>
              	  <c:if test="${e.e_state eq 1}">진행중</c:if>
              	  <c:if test="${e.e_state eq 2}">완료</c:if>  		
              </td>
              <td><c:if test="${e.e_state eq 0 and e.e_reason eq 0}">
              <input type="hidden" id="o_no" name="o_no" value="${e.o_no}">
              <button onclick="exchanging()">접수하기</button></c:if></td>
            </tr>
            </c:forEach>
          <!--주문 목록 출력 끝-->
          </tbody>
        </table>
        <div class="paging orderList__paging">
          <!--페이징 출력-->
          <a class="page-value">1</a>
          <a class="page-value">2</a>
          <a class="page-value">3</a>
          <a class="page-value">4</a>
          <a class="page-value">5</a>
        </div>
      </div>
    </main>
  </div>
  <footer id="admin-footer"></footer>
</div>
</body>
</html>