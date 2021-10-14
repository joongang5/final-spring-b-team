<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 | 가구</title>
<link rel="stylesheet" href="./resources/css/base.css">
<link rel="stylesheet" href="./resources/css/mypage.css">
<style>
        .change-password-container{
            border: 5px solid #eeded5;
            padding: 40px;
            /* margin: 0 auto; */
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .change-password-header{
            margin-bottom: 25px;
        }

        .change-password-body{
            width: 65%;
        }

        .myInfo-content__short-container{
            display: flex;
            align-items: center;
            justify-content: space-around;
            margin-bottom: 10px;
        }

        .change-password__section{
            font-weight: 500;
            width: 22%;
        }

        .change-password__value{

        }

        .change-password-footer{
            margin-top: 25px;
        }

        .change-password-footer button{
            width: 220px;
            height: 55px;
            font-size: medium;
            border-radius: 14px;
        }

    </style>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.js">
</script>
<script type="text/javascript">
	$(document).ready(function() {
		//alert("정상 작동확인");
	});

	function pw1Check() {
		var pw1 = $("#pw1").val();
		if (pw1 == "" || pw1.length < 5) {
			$("#checkResult1").css("color", "red");
			$("#checkResult1").text("비밀번호는 최소 다섯 글자 이상이어야 합니다.");
			$("#pw1").focus();
			$("#updateBtn").attr("disabled", true);
			return false;
		} else {
			$("#checkResult1").css("color", "blue");
			$("#checkResult1").text("");
			return true;
		}
	}

	function pw2Check() {
		var pw1 = $("#pw1").val();
		var pw2 = $("#pw2").val();
		if (pw1 != pw2) {
			$("#checkResult2").css("color", "red");
			$("#checkResult2").text("비밀번호가 일치하지 않습니다.");
			$("#pw1").focus();
			$("#updateBtn").attr("disabled", true);
			return false;
		} else {
			$("#checkResult2").css("color", "blue");
			$("#checkResult2").text("");
			$("#updateBtn").attr("disabled", false);
			return true;
		}
	}

	function submit() {
		alert("비밀번호가 수정되었습니다.");
	}
</script>
<title>비밀번호수정</title>
</head>
<body>
<!--myPage 공통 부분-->
<div id="layout-container">
    <header id="header-space"></header>
    <div id="myPage-main-container">
        <nav id="myPage-sideMenu">
            <div class="sideMenu__block-container">
                <div class="sideMenu__block">
                    <h3>나의 쇼핑 활동</h3>
                    <ul class="sideMenu__items">
                        <li class="sideMenu__item"><a href="./orderhistory.do">구매 내역 조회</a></li>
                        <li class="sideMenu__item"><a href="">최근 본 상품</a></li>
                        <li class="sideMenu__item"><a href="">쿠폰 / 적립금 조회</a></li>
                        <li class="sideMenu__item"><a href="">상품 문의</a></li>
                        <li class="sideMenu__item"><a href="">1:1 문의</a></li>
                    </ul>
                </div>
                <div class="sideMenu__block">
                    <h3>회원 정보</h3>
                    <ul class="sideMenu__items">
                        <li class="sideMenu__item"><a href="./myinfo.do">회원 정보
									조회</a></li>
							<li class="sideMenu__item"><a href="">주소록</a></li>
							<li class="sideMenu__item"><a href="./myinfoUpdatePW.do">비밀번호
									변경</a></li>
							<li class="sideMenu__item sideMenu__item--active"><a
								href="./myinfoDelete.do">회원 탈퇴</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <main>
            <div class="myPage-title">
                <h1>비밀번호 변경</h1>
            </div>
<!--myPage 공통 부분 끝-->
            <div class="change-password-container">
                <div class="change-password-header">
                    비밀번호를 변경하려면 다음 정보를 입력하세요.
                </div>
                <form action="./myAccountChangePW.do" method="post"
				onsubmit="submit()">
                <div class="change-password-body">
                    <!--현재 비밀번호, 변경할 비밀번호*2-->
                    <div class="myInfo-content__short-container">
                    <!-- <div class="change-password__section">
                        현재 비밀번호
                    </div>
                    <div class="change-password__value">
                        <input type="password" class="password">
                    </div> -->
                    </div>
                    <div class="myInfo-content__short-container">
                    <div class="change-password__section">
                        변경할 비밀번호
                    </div>
                    <div class="change-password__value">
                        <input type="password" name="pw1" id="pw1"
							required="required" onchange="return pw1Check()" class="password">
						<p id="checkResult1"></p>
                    </div>
                    </div>
                    <div class="myInfo-content__short-container">
                    <div class="change-password__section">
                        비밀번호 확인
                    </div>
                    <div class="change-password__value">
                        <input type="password" name="pw2" id="pw2"
							required="required" onchange="return pw2Check()" class="password">
						<p id="checkResult2"></p>
                    </div>
                    </div>
                </div>
                <div class="change-password-footer">
                    <button type="submit" id="updateBtn" disabled="disabled">비밀번호 변경하기</button>
                </div>
            </form>
            <c:if test="${param.msg eq 'ok'}">
				<script type="text/javascript">
					alert("비밀번호가 변경되었습니다.");
				</script>
			</c:if>
            </div>
        </main>
    </div>
    <footer id="footer-space"></footer>
</div>
</body>
</html>