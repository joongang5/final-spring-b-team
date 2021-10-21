<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
  function linkPage(pageNo) {
		location.href = "./admin_exchangeList.do?pageNo="
				+ pageNo;
	}
  
  </script>
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
<c:if test="${sessionScope.m_grade ne 1 }">
	<c:redirect url="login.do" />
</c:if>
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
                <li class="sideMenu__subItem"><a href="./admin_orderList.do">주문 목록</a></li>
                <li class="sideMenu__subItem sideMenu__subItem--active"><a href="./admin_exchange.do">교환 관리</a></li>
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
        <h1>교환 신청 내역</h1>
      </div>
   
      <div class="orderList-container">
        <table class="list-table orderList">
          <thead>
            <tr>
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
			<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="linkPage" />
        </div>
        
      </div>
    </main>
  </div>
  <footer id="admin-footer"></footer>
</div>
</body>
</html>