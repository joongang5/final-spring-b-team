<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>적립금 조회 | Spring.B</title>
    <script src="./resources/js/inParentWindow.js"></script>
    <script>
	function linkPage(pageNo) {
		location.href = "mypage_point.do?pageNo="
				+ pageNo
				<c:if test="${param.category == 'use' && param.category == 'gain'}">+ "&category=${param.category}"</c:if>
	}
    </script>
    <link rel="stylesheet" href="./resources/css/base.css">
    <link rel="stylesheet" href="./resources/css/mypage.css">
    <link href="./resources/css/footer.css" rel="stylesheet"/>
    <style>
        .point-summary{
            /* display: flex; */
            border: 4px solid #EEDED5;
            margin: 20px 10px 50px 10px;
            height: 80px;
            display: flex;
            justify-content: center;
        }

        .point-summary__itemContainer{
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 18pt;
            font-weight: 600;
        }

        .point-summary__logo{
            display: flex;
            width: 60px;
        }

        .point-summary__logo img{
            width: 50px;
            height: 50px;
        }

        .point-summary__section{
            margin-right: 20px;
        }

        .point-summary__value{

        }

        .amount__value{
            font-family: math;
            margin-right: 5px;
            color: #ff8a00;
            font-weight: 600;
        }

        .pointLogList-container{

        }

        .pointLogList-category-container{
            margin: 10px 0;
        }

        .pointLogList-category{
            display: flex;
            font-size: 15pt;
        }

        .pointLogList-category__item{
            position: relative;
            margin-right: 30px;
        }

        .pointLogList-category__item::after{
            content: '';
            position: absolute;
            width: 2px;
            height: 22px;
            top: 5px;
            left: 52px;
            background: #e5e5e5;
        }

        table{
            width: 100%;
            border-collapse: collapse;
            border-top: 1px solid #403429;
            border-bottom: 1px solid #403429;
            /* border: 2px solid #403429; */
            /* height: 144px; */
        }

        tr{
            height: 50px;
        }
        
        tr:hover{
        	background: #f9f9f9;
        }

        tr:not(:last-child){
            border-bottom: 1px solid #eeded5;
        }

        th{
            background: #eeded5;
            /* height: 45px; */
        }

        td{
            text-align: center;
        }

        th:first-child{
            width: 50%;
        }

        th:nth-child(2){
            width: 16%;
        }

        th:nth-child(3){
            width: 34%;
        }

        .pointLogList__paging{
            text-align: center;
            margin-top: 15px;
            font-size: 17pt;
        }

        .pointLogList__paging a:after{
            opacity: 0;
        }

        .page-value {
            width: 15px;
            height: 15px;
            /*
            font-size: large;
            display: grid;
            place-items: center;
            margin: 0 10px;
            */
            margin-left: 20px;
        }

        .page-value:hover {
            /*
            background-color: #6bf2e5;
            border-radius: 55px;
             */
            color: #FF8A00;
        }

        .pointLogList-category__active{
            font-weight: 600;
            /* color: #e8610c; */
        }

        .plusPoint{
        }

        .plusPoint::before{
            content: '적립';
            color: royalblue;
            border: 1px solid;
            padding: 5px;
            border-radius: 20px;
            margin-right: 5px;
        }

        .minusPoint{
        }

        .minusPoint::before{
            content: '사용';
            color: crimson;
            border: 1px solid;
            padding: 5px;
            border-radius: 20px;
            margin-right: 5px;
        }

    </style>
</head>
<body>
<c:if test="${sessionScope.m_id eq null }">
	<script> inParentWindow(); </script>
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
							<li class="sideMenu__item"><a href="./mypage_recent.do">최근 본 상품</a></li>
							<li class="sideMenu__item sideMenu__item--active"><a href="./mypage_point.do">적립금 조회</a></li>
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
							<li class="sideMenu__item"><a href="./myinfoDelete.do">회원 탈퇴</a></li>
						</ul>
                </div>
            </div>
        </nav>
        <main>
            <div class="myPage-title">
                <h1>적립금 조회</h1>
            </div>
            <!--myPage 공통 부분 끝-->
            <div class="point-summary">
                <div class="point-summary__itemContainer">
                    <div class="point-summary__logo">
                        <img src="./resources/images/point.png">
                    </div>
                    <div class="point-summary__section">
                        사용 가능한 적립금 :
                    </div>
                    <div class="point-summary__value">
                        <span class="amount__value"><fmt:formatNumber value="${m_point}" pattern="#,###"/></span>원
                    </div>
                </div>
            </div>
            <div class="pointLogList-container">
                <div class="pointLogList-category-container">
                    <div class="pointLogList-category">
                        <div class="pointLogList-category__item">
                            <a <c:if test="${param.category != 'use' && param.category != 'gain'}">class="pointLogList-category__active"</c:if> href="mypage_point.do">전체</a>
                        </div>
                        <div class="pointLogList-category__item">
                            <a <c:if test="${param.category == 'use'}">class="pointLogList-category__active"</c:if> href="mypage_point.do?category=use">사용</a>
                        </div>
                        <div class="pointLogList-category__item">
                            <a <c:if test="${param.category == 'gain'}">class="pointLogList-category__active"</c:if> href="mypage_point.do?category=gain">적립</a>
                        </div>
                    </div>
                </div>
                <table class="pointLogList">
                    <thead>
                    <tr>
                        <th scope="col">내용</th>
                        <th scope="col">날짜</th>
                        <th scope="col">적립금</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!--적립금 로그 출력 / 반복문 사용-->
                    <c:choose>
                    	<c:when test="${fn:length(pointLogList) > 0}">
                    		<c:forEach items="${pointLogList}" var="list">
	                    		<tr>
			                        <td>
			                        	<c:choose>
			                            	<c:when test="${list.po_vary == '+'}">
			                            	<span class="plusPoint"></span>
			                            	</c:when>
			                            	<c:when test="${list.po_vary == '-'}">
			                            	<span class="minusPoint"></span>
			                            	</c:when>
			                            </c:choose>
			                            ${list.po_source}
			                        </td>
			                        <td><fmt:formatDate value="${list.po_date}" pattern="yyyy-MM-dd HH:mm"/></td>
			                        <td>
			                            <span class="amount__value">
			                            <c:choose>
			                            	<c:when test="${list.po_vary == '+'}">
			                            	+
			                            	</c:when>
			                            	<c:when test="${list.po_vary == '-'}">
			                            	-
			                            	</c:when>
			                            </c:choose>
			                            <fmt:formatNumber value="${list.po_value}" pattern="#,###"/></span>
			                        </td>
			                    </tr>
                    		</c:forEach>
                    	</c:when>
                    	<c:otherwise>
                    			<tr>
									<td colspan="3">
									적립금 적립 및 사용 내역이 없습니다.
								</tr>
                    	</c:otherwise>
                    </c:choose>
                    <!--목록 출력 끝-->
                    </tbody>
                </table>
                <div class="pointLogList__paging">
                    <!--페이징 출력-->
                    <c:choose>
                    	<c:when test="${fn:length(pointLogList) > 0}">
                    		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage"/>
                    	</c:when>
                    	<c:otherwise>
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