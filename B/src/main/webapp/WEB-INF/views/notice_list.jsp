<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 | Spring.B</title>
<link rel="stylesheet" href="./resources/css/base.css">
<link rel="stylesheet" href="./resources/css/mypage.css">
<link href="./resources/css/footer.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./resources/js/inParentWindow.js"></script>
<style>
    .board-container{
        margin-top: 50px;
    }

    table{
        width: 100%;
        border-collapse: collapse;
        border-top: 2px solid #403429;
        /* border-bottom: 1px solid #403429; */
        /* border: 2px solid #403429; */
    }

    tr{
        height: 55px;
        border-bottom: 1px solid #4034295e;
    }
    
    tr:not(thead tr) {
   		cursor: pointer;
    }

    .boardList__normal:hover{
        background: #f9f9f9;
    }

    .boardList__important{
        background: #eeded580; /*#eeded5에서 불투명도 0.5인 색*/
    }

    .boardList__normal{

    }

    .boardList__important .boardList__title{
    font-weight: 700;
}
    
    .boardList__title{
        text-align: left;
        padding-left: 15px;
    }

    th{
        /* background: #eeded5; */
        /* height: 45px; */
        border-bottom: 1px solid #403429;
    }

    td{
        text-align: center;
    }

    th:first-child{
        width: 6%;
    }

    th:nth-child(2){
        width: 69%;
    }

    th:nth-child(3){
        width: 25%;
    }

    td:nth-child(3){
        width: 35%;
    }

    .boardList__buttonContainer {
        border-bottom: none;
        /* text-align: right; */
        height: 105px;
    }

    .boardList__buttonContainer td{
        text-align: right;
    }

    .boardList__buttonContainer button{
        height: 45px;
        width: 120px;
        border-radius: 14px;
        font-size: 13pt;
    }

    .boardList__paging{
        text-align: center;
        margin-top: 15px;
        font-size: larger;
    }

    .boardList__paging a:after{
        opacity: 0;
    }

</style>
<script type="text/javascript">
window.addEventListener('DOMContentLoaded', saveLocation("notice_list"));

function linkPage(pageNo) {
location.href = "./notice_list.do?pageNo="+pageNo;
}

</script>
</head>
<body>
<div id="layout-container">
    <div id="myPage-main-container">
        <nav id="myPage-sideMenu">
				<div class="sideMenu__block-container">
					<div class="sideMenu__block">
						<h3>나의 쇼핑 활동</h3>
						<ul class="sideMenu__items">
							<li class="sideMenu__item"><a href="./orderhistory1.do">구매 내역 조회</a></li>
							<li class="sideMenu__item"><a href="./mypage_recent.do">최근 본 상품</a></li>
							<li class="sideMenu__item"><a href="./mypage_point.do">적립금 조회</a></li>
							<li class="sideMenu__item sideMenu__item--active"><a href="./notice_list.do">공지사항</a></li>
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
            <div class="board-title">
                <h1>공지사항</h1>
            </div>
            <div class="board-container">

                <table class="boardList">
                    <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!--중요 공지 출력 / 반복문 사용-->
                    <c:forEach items="${list_important }" var="li">
                    <tr class="boardList__important" onClick="location.href='./notice_detail.do?n_no=${li.n_no }'">
                        <td>${li.n_no }</td>
                        <td class="boardList__title">${li.n_title }</td>
                        <td>${li.n_date }</td>
                    </tr>
                    </c:forEach>
                    <!--중요 공지 출력 끝-->
                    <!--그냥 공지 출력 / 반복문 사용-->
                    <c:forEach items="${list_normal }" var="ln">
                    <tr class="boardList__normal" onClick="location.href='./notice_detail.do?n_no=${ln.n_no }'">
                        <td>${ln.n_no }</td>
                        <td class="boardList__title">${ln.n_title }</td>
                        <td>${ln.n_date }</td>
                    </tr>
                    </c:forEach>
                    <!--그냥 공지 출력 끝-->
                    <c:if test="${sessionScope.m_grade eq 1 }">
                    <tr class="boardList__buttonContainer">
                        <td colspan="3">
                            <button onclick="location.href='./notice_write.do'">등록하기</button>
                        </td>
                    </tr>
                    </c:if> 
                    </tbody>
                </table>
                <div class="boardList__paging">
                    <!--페이징 출력-->
                    <ui:pagination paginationInfo="${paginationInfo }" type="text" jsFunction="linkPage" />
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