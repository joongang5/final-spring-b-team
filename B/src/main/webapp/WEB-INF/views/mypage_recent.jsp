<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>최근 본 상품 | Spring.B</title>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="./resources/js/inParentWindow.js"></script>
  <script>
  window.addEventListener('DOMContentLoaded', saveLocation("mypage_recent.do"));
  </script>
  <link rel="stylesheet" href="./resources/css/base.css">
  <link rel="stylesheet" href="./resources/css/mypage.css">
  <link href="./resources/css/footer.css" rel="stylesheet"/>
  <style>
    .recent-notice{
    }

    .recent-notice h3{
    }

    .recentList-contents-container{
      margin-top: 30px;
      border-top: 4px solid #eeded5;
    }

    .recent-content{
    }

    .recent-content__body{
      display: flex;
      /* margin: 10px 0; */
    }

    .recent-content__body+.recent-content__body{
      border-top: 1px solid #e5e5e5;
    }

    .recent-content-productContainer{
      display: flex;
      width: 90%;
      align-items: center;
    }

    .recent-product-left-block{

    }

    .product-content__productThumbnail{
      width: 150px;
      height: 150px;
      overflow: hidden;
    }

    .product-content__productThumbnail img{
      width: 100%;
      object-fit: cover;
    }

    .recent-product-right-block{
      height: 120px;
      margin-left: 20px;
      width: 100%;
      display: grid;
      align-items: center;
      align-content: space-evenly;
      /* flex-direction: column; */
    }

    .product-content__category{
      /* color: #a1a1a1; */
    }

    .product-content__name{
      font-weight: 700;
      font-size: 17pt;
      margin-bottom: 5px;
    }

    .product-content__price{
      font-size: 14pt;
    }

    .amount__value{
      font-family: math;
      margin-right: 5px;
      color: #ff8a00;
      font-weight: 600;
    }


  </style>
</head>
<body>
<c:if test="${sessionScope.m_id eq null }">
	<script> noSession(); </script>
</c:if>
<!--myPage 공통 부분-->
<div id="layout-container">
  <div id="myPage-main-container">
    <nav id="myPage-sideMenu">
      <div class="sideMenu__block-container">
        <div class="sideMenu__block">
          <h3>나의 쇼핑 활동</h3>
			<ul class="sideMenu__items">
				<li class="sideMenu__item"><a href="./orderhistory1.do">구매 내역 조회</a></li>
				<li class="sideMenu__item sideMenu__item--active"><a href="./mypage_recent.do">최근 본 상품</a></li>
				<li class="sideMenu__item"><a href="./mypage_point.do">적립금 조회</a></li>
				<li class="sideMenu__item"><a href="./notice_list.do">공지사항</a></li>
			</ul>
		</div>
		<div class="sideMenu__block">
			<h3>회원 정보</h3>
			<ul class="sideMenu__items">
				<li class="sideMenu__item"><a href="./myinfo.do">회원 정보 조회</a></li>
				<li class="sideMenu__item"><a href="./myinfoUpdatePW.do">비밀번호 변경</a></li>
				<li class="sideMenu__item"><a href="./myinfoDelete.do">회원 탈퇴</a></li>
			</ul>
        </div>
      </div>
    </nav>
    <main>
      <div class="myPage-title">
        <h1>최근 본 상품</h1>
      </div>
      <!--myPage 공통 부분 끝-->
      <div class="recent-notice">
        <h4>최근 본 상품이 최대 10개까지 표시됩니다.</h4>
      </div>
      <div class="recentList-contents-container">
        <div class="recent-content">
        <c:choose>
        <c:when test="${fn:length(recentLogList) > 0}">
	        <c:forEach items="${recentLogList}" var="list">
	        <!--최근 본 상품 출력 / 반복문 사용-->
	          <div class="recent-content__body">
	            <div class="recent-content-productContainer">
	              <div class="recent-product-left-block">
	                <div class="product-content__productThumbnail">
	                  <img src="https://blogger.googleusercontent.com/img/a/${list.p_img}">
	                </div>
	              </div>
	              <div class="recent-product-right-block">
	                <div class="product-content__category">
	                    ${list.c_main} > ${list.c_sub}
	                </div>
	                <div class="product-content__tag-container">
	                <div class="product-content__name">
	                    <a href="javascript:void(0);" onclick="anotherLocation('./detail.do?category=${list.c_main}&&sub=${list.c_sub}&&product=${list.p_no}');">${list.p_title}</a>
	                </div>
	                <div class="product-content__price">
	                  <span class="amount__value"><fmt:formatNumber value="${list.p_price}" pattern="#,###"/></span>원
	                </div>
	                </div>
	              </div>
	            </div>
	          </div>
	          <!--최근 본 상품 출력 끝-->
	          </c:forEach>
        </c:when>
		<c:otherwise>
            상품 조회 내역이 없습니다.
        </c:otherwise>
        </c:choose>
        </div>
      </div>
    </main>
  </div>
</div>
<footer id="footer-space">
	<c:import url="./footer.jsp"/>
</footer>
</body>
</html>