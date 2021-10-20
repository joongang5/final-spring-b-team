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
<div id="layout-container">
    <div id="board-main-container">
        <main>
            <div class="board-title">
                <h1>공지사항</h1>
            </div>
            <div class="board-container">
                <div class="boardDetail-buttonContainer-top">
                    <button onclick="update( ${detail.n_no})">수정</button>
                    <button onclick="del( ${detail.n_no})">삭제</button>
                </div>
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
</body>
</html>