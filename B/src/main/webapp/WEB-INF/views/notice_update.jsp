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
    <!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src="./resources/summernote/summernote-ko-KR.js"></script>
    <style>
        .board-container{
            margin-top: 50px;
            width: 100%;
        }

        .boardWrite-shortContainer{
            display: flex;
            align-items: center;
            height: 60px;
        }

        .boardWrite-shortContainer__section{
            width: 15%;
            font-weight: 600;
            text-align: center;
        }

        .boardWrite-shortContainer__content{
            width: 85%;
        }

        .boardWrite-shortContainer__content input[type="text"]{
            width: 90%;
            padding: 9px 14px;
            border-radius: 12px;
        }

        .boardWrite-shortContainer__content select{
            background-color: #eeded5;
            padding: 11px 15px;
            border-radius: 12px;
            width: 140px;
            background-position-y: 57%;
        }

        .boardWrite-wideContainer{

        }

        .boardWrite-wideContainer__content{
            padding: 20px 4%;
        }

        textarea{
            background: #eeded5;
            border-radius: 12px;
            width: 92%;
            height: 580px;
            border: none;
            padding: 35px;
            color: #403429;
            font-family: 'IBM Plex Sans KR';
            font-size: 13pt;
        }

        textarea:focus-visible{
            outline: 1px solid #403429;
        }

        .boardWrite-buttonContainer{
            text-align: center;
            margin-bottom: 50px;
        }

        .boardWrite-buttonContainer button{
            width: 135px;
            height: 50px;
            font-size: 13pt;
            border-radius: 12px;
        }

    </style>
     <script type="text/javascript">
    $(document).ready(function() {
    	  $('#summernote').summernote({
    	    lang: 'ko-KR', // default: 'en-US'
    	    height: 580,                 // set editor height
      	  	minHeight: 580,             // set minimum height of editor
      	  	maxHeight: 580,             // set maximum height of editor
      	  	focus: true                  // set focus to editable area after initializing summernote
    	  });
    	});
    </script>
</head>
<body>
<c:if test="${sessionScope.m_grade ne 1 }">
	<c:redirect url="login.do" />
</c:if>
<div id="layout-container">
    <div id="board-main-container">
        <main>
            <div class="board-title">
                <h1>공지사항 수정</h1>
            </div>
            <form action="./notice_update.do" method="post">
            <input type="hidden" name="n_no" value="${detail.n_no}">
            <div class="board-container">
              <div class="boardWrite-shortContainer">
                  <div class="boardWrite-shortContainer__section">
                      제목
                  </div>
                  <div class="boardWrite-shortContainer__content">
                      <input type="text" name="n_title" value="${detail.n_title}" />
                  </div>
              </div>
              <div class="boardWrite-shortContainer">
                    <div class="boardWrite-shortContainer__section">
                        공지 중요도
                    </div>
                    <div class="boardWrite-shortContainer__content">
                        <select name="n_important">
							<option value="1" <c:if test="${detail.n_important eq '1'}">selected="selected"</c:if>>중요 공지</option>
							<option value="0" <c:if test="${detail.n_important eq '0'}">selected="selected"</c:if>>일반 공지</option>
						</select>
                    </div>
              </div>
                <div class="boardWrite-wideContainer">
                    <div class="boardWrite-wideContainer__content">
                        <textarea id="summernote" name="n_content">${detail.n_content }</textarea>
                    </div>
               </div>
                <div class="boardWrite-buttonContainer">
                    <button type="submit" >수정하기</button>
                </div>
            </div>
            </form>
        </main>
    </div>
</div>
</body>
</html>