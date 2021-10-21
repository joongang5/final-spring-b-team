<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>공지사항 | Spring.B</title>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="./resources/js/inParentWindow.js"></script>
    <script type="text/javascript">
		function del(no){
			if(confirm("해당 게시글을 삭제하시겠습니까?")){
				location.href="./noticeDelete.do?n_no="+no;
			}
		}
		
		function update(no){
			if(confirm("해당 게시글을 수정하시겠습니까?")){
				location.href="./notice_update.do?n_no="+no;
			}
		}
</script>
<link rel="stylesheet" href="./resources/css/base.css">
<link rel="stylesheet" href="./resources/css/mypage.css">
<link href="./resources/css/footer.css" rel="stylesheet"/>
<style>
    .board-container{
        margin-top: 50px;
    }

    table{
        width: 100%;
        border-collapse: collapse;
        border-top: 1px solid #403429;
    }

    tr{
        /* height: 55px; */
        border-bottom: 1px solid #4034295e;
    }

    tr:first-child{

    }

    tr:nth-child(2) {
        height: 37px;
    }

    th{
        /* background: #eeded5; */
        /* height: 45px; */
        /* border-bottom: 1px solid #403429; */
        /* width: 20%; */
    }

    td{
        /* text-align: center; */
    }

    .boardDetail-title__value{
        text-align: left;
        padding-left: 25px;
        font-size: 18pt;
        height: 70px;
        background: #eeded5;
        /* border-bottom: 1px solid; */
    }

    .boardDetail-date__section{
        width: 10%;
        height: 42px;
    }

    .boardDetail-date__value{
        text-align: left;
        padding-left: 10px;
    }

    .boardDetail-content__section{

    }

    .boardDetail-content__value{
        padding: 40px 25px;
    }

    .boardDetail-buttonContainer-top {
        text-align: right;
        height: 60px;
    }

    .boardDetail-buttonContainer-bottom{
        height: 100px;
        border-bottom: none;
    }

    .boardDetail-buttonContainer-bottom td{
        text-align: left;
    }

    button{
        height: 45px;
        width: 90px;
        border-radius: 14px;
        font-size: 12pt;
        margin-right: 10px;
    }

    .boardDetail-buttonContainer-bottom button{
        width: 115px;
    }


</style>
</head>
<body>
<c:if test="${sessionScope.m_id eq null }">
	<c:redirect url="login.do" />
</c:if>
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
							<li class="sideMenu__item"><a href="">상품 문의</a></li>
							<li class="sideMenu__item"><a href="">1:1 문의</a></li>
							<li class="sideMenu__item"><a href="./notice_list.do">공지사항</a></li>
						</ul>
					</div>
					<div class="sideMenu__block">
						<h3>회원 정보</h3>
						<ul class="sideMenu__items">
							<li class="sideMenu__item sideMenu__item--active"><a href="./myinfo.do">회원 정보 조회</a></li>
							<li class="sideMenu__item"><a href="">주소록</a></li>
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
            	<c:if test="${sessionScope.m_grade eq 1 }">
                <div class="boardDetail-buttonContainer-top">
                    <button onclick="update( ${detail.n_no})">수정</button>
                    <button onclick="del( ${detail.n_no})">삭제</button>
                </div>
                </c:if>
                <table class="boardDetail">
                    <tr>
                        <th class="boardDetail-title__value" colspan="2">${detail.n_title}</th>
                    </tr>
                    <tr>
                        <th class="boardDetail-date__section" scope="row">작성일</th>
                        <td class="boardDetail-date__value">${detail.n_date }</td>
                    </tr>
                    <tr class="boardDetail-content__section">
                        <td class="boardDetail-content__value" colspan="2">
                            ${detail.n_content}
                        </td>
                    </tr>
                    <tr class="boardDetail-buttonContainer-bottom">
                        <td colspan="2">
                            <button onclick="location.href='./notice_list.do'">목록으로</button>
                        </td>
                    </tr>
                </table>
            </div>
        </main>
    </div>
</div>
<footer id="footer-space">
		<c:import url="./footer.jsp"/>
		</footer>
</body>
</html>