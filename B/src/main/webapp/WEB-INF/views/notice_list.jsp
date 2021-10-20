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

    .boardList__normal:hover{
        background: #f9f9f9;
    }

    .boardList__important{
        background: #eeded5;
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
</head>
<body>
<div id="layout-container">
    <div id="board-main-container">
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
                    <tr class="boardList__important">
                        <td>${li.n_no }</td>
                        <td class="boardList__title"><a href="./notice_detail.do?n_no=${li.n_no }">${li.n_title }</a></td>
                        <td>${li.n_date }</td>
                    </tr>
                    </c:forEach>
                    <!--중요 공지 출력 끝-->
                    <!--그냥 공지 출력 / 반복문 사용-->
                    <c:forEach items="${list_normal }" var="ln">
                    <tr class="boardList__normal">
                        <td>${ln.n_no }</td>
                        <td class="boardList__title"><a href="./notice_detail.do?n_no=${ln.n_no }">${ln.n_title }</a></td>
                        <td>${ln.n_date }</td>
                    </tr>
                    </c:forEach>
                    <!--그냥 공지 출력 끝-->
                    <tr class="boardList__buttonContainer">
                        <td colspan="3">
                            <button onclick="location.href='./notice_write.do'">등록하기</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="boardList__paging">
                    <!--페이징 출력-->
                    1 2 3 4 5
                </div>
            </div>
        </main>
    </div>
</div>
</body>
</html>