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
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<!-- include summernote css/js-->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
	<!-- include summernote-ko-KR -->
	<script src="./resources/js/summernote-ko-KR.js"></script>
	<script src="./resources/js/inParentWindow.js"></script>
	<script>
	window.addEventListener('DOMContentLoaded', saveLocation("notice_write.do"));
	
	    $(document).ready(function() {
	  	  $('#summernote').summernote({
	   	    	placeholder: 'content',
	  	        minHeight: 580,
	  	        maxHeight: 580,
	  	        focus: true, 
	  	        lang : 'ko-KR'
	  	  });
	  	});
    
    function check() {
		//alert("!");
		var title = document.getElementById("title");
		var content = document.getElementById("summernote");
		//alert(title.value + " : " + content.value);

		if (title.value.length < 5 || title.value == "") {
			alert("제목을 5글자 이상 적어주세요.");
			title.focus();
			return false;
		}
		if (content.value == "" || content.value.length < 10) {
			alert("내용을 10자 이상 적어주세요.");
			content.focus();
			return false;
		}
	}
    </script>
    <link rel="stylesheet" href="./resources/css/base.css">
	<link rel="stylesheet" href="./resources/css/mypage.css">
	<link href="./resources/css/footer.css" rel="stylesheet"/>
    <style>
	    html {
	    font-family: 'IBM Plex Sans KR', sans-serif;
	    color: #403429;
		}
		
		h1, h2, h3, ul, li{
		font-family: 'IBM Plex Sans KR', sans-serif;
		}
		
		ul, li{
		font-size : medium; 
		}
		
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
            padding: 21px 14px;
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
            resize: none;
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
</head>
<body>
<c:if test="${sessionScope.m_grade ne 1 }">
	<script> noSession(); </script>
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
                <h1>공지사항 등록</h1>
            </div>
            <form action="./notice_write.do" method="post" onsubmit="return check();">
            <div class="board-container">
              <div class="boardWrite-shortContainer">
                  <div class="boardWrite-shortContainer__section">
                      제목
                  </div>
                  <div class="boardWrite-shortContainer__content">
                      <input type="text" name="n_title" id="title" />
                  </div>
              </div>
              <div class="boardWrite-shortContainer">
                    <div class="boardWrite-shortContainer__section">
                        공지 중요도
                    </div>
                    <div class="boardWrite-shortContainer__content">
                        <select name="n_important">
                            <option value="1">중요 공지</option>
                            <option value="0">일반 공지</option>
                        </select>
                    </div>
              </div>
                <div class="boardWrite-wideContainer">
                    <div class="boardWrite-wideContainer__content">
                        <textarea id="summernote" name="n_content"></textarea>
                    </div>
               </div>
                <div class="boardWrite-buttonContainer">
                    <button type="submit">작성하기</button>
                </div>
            </div>
            </form>
        </main>
    </div>
</div>
<footer id="footer-space">
		<c:import url="./footer.jsp"/>
		</footer>
</body>
</html>