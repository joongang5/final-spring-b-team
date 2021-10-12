<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 | 가구</title>
<link rel="stylesheet" href="./resources/css/base.css">
<link rel="stylesheet" href="./resources/css/mypage.css">
<style>
        .myInfo-container{
            
        }

        .myInfo-body{
            border: 5px solid #eeded5;
            padding: 40px;
        }

        .myInfo-content__short-container{
            display: flex;
            padding: 5px 0;
            justify-content: flex-start;
            font-size: 13pt;
            align-items: center;
            min-height: 50px;
        }

        .myInfo-content__section{
            width: 20%;
            /* font-size: larger; */
            font-weight: 600;
            border-right: 2px solid #e5e5e5;
            text-align: right;
            padding-right: 10px;
        }

        .myInfo-content__value{
            width: 60%;
            margin: 0 19px 0 20px;
        }

        .myInfo-content__change{
            width: 15%;
            text-align: center;
        }

        .myInfo-content__change button{
            width: 100px;
            padding: 10px;
            border-radius: 10px;
            font-size: 12pt;
        }

        .phoneNo{

        }

        .change-content-container{
            padding: 10px 0 10px 20px;
            margin-left: 20%;
            font-size: 13pt;
        }

        .change-content{margin-bottom: 15px;}

        .change-form{

        }

        .change-phoneNo{
            display: none;
        }

        .change-phoneNo input[type="tel"]{
            width: 275px;
        }

        .change-buttons-container{
            text-align: right;
            margin: 10px 10px 0 0;
        }

        .change-buttons-container button{
            padding: 10px;
            width: 110px;
            border-radius: 10px;
            font-size: 12pt;
        }

        .email-address{

        }

        .change-email{
            display: none;
        }

        .change-email input[type="email"]{
            width: 330px;
        }

        .change-address{
        /* display: none; */
        }

        .change-address .small-button{
            height: 37px;
            width: 110px;
            font-size: 11pt;
        }

        .change-address input[type="text"]{
            display: block;
            margin-bottom: 10px;
        }

        .change-address input[type="text"]:nth-child(2){
            display: inline;
            width: 100px;
        }

        .change-address input[type="text"]:nth-child(3){
            width: 500px;
        }

        .change-address input[type="text"]:nth-child(4){
            width: 500px;
        }

    </style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
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
                            <li class="sideMenu__item"><a href="">구매 내역 조회</a></li>
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
                    <h1>내 정보 조회</h1>
                </div>
<!--myPage 공통 부분 끝-->
                <div class="myInfo-container">
                    <div class="myInfo-body">
                        <!--아이디와 이름은 변경 불가-->
                        <div class="myInfo-content__short-container">
                            <div class="unchangeable myInfo-content__section">
                                아이디
                            </div>
                            <div class="unchangeable myInfo-content__value">
                                <span>${myinfo.m_id }</span>
                            </div>
                        </div>
                        <div class="myInfo-content__short-container">
                            <div class="unchangeable myInfo-content__section">
                                이름
                            </div>
                            <div class="unchangeable myInfo-content__value">
                                <span>${myinfo.m_name }</span>
                            </div>
                        </div>
                        <div class="myInfo-content__short-container">
                            <div class="phoneNo myInfo-content__section">
                                    휴대전화
                            </div>
                            <form action="./myinfoUpdatePhone.do" method="post">
                            <div class="phoneNo myInfo-content__value">
                                <input type="text" name="m_phone" value="${myinfo.m_phone }">
                            </div>
                            <div class="phoneNo myInfo-content__change">
                                <button type="submit">변경</button>
                            </div>
                            </form>
                        </div>
                        <!--변경 버튼 누르면 .myInfo-content__value, .myInfo-content__change 대신 출력됨-->
                        <div class="change-phoneNo change-content-container">
                            <div class="change-phoneNo change-content">
                                변경할 휴대폰 번호를 입력하세요.
                            </div>
                            <div class="change-phoneNo change-form">
                                <input type="tel">
                            </div>
                            <div class="change-phoneNo change-buttons-container">
                                <button>변경하기</button>
                                <button>취소하기</button>
                            </div>
                        </div>
                        <div class="myInfo-content__short-container">
                            <div class="email-address myInfo-content__section">
                                이메일 주소
                            </div>
                            <form action="./myinfoUpdateEmail.do" method="post">
                            <div class="email-address myInfo-content__value">
                                <input type="email" name="m_email" value="${myinfo.m_email}">
                            </div>
                            <div class="email-address myInfo-content__change">
                                <button type="submit">변경</button>
                            </div>
                            </form>
                        </div>
                        <!--변경 버튼 누르면 .myInfo-content__value, .myInfo-content__change 대신 출력됨-->
                        <div class="change-email change-content-container">
                            <div class="change-email change-content">
                                변경할 이메일 주소를 입력하세요.
                            </div>
                            <div class="change-email change-form">
                                <input type="email">
                            </div>
                            <div class="change-email change-buttons-container">
                                <button>변경하기</button>
                                <button>취소하기</button>
                            </div>
                        </div>
                        <div class="myInfo-content__short-container">
                            <div class="address myInfo-content__section">
                                주소
                            </div>
                            <form action="./myinfoUpdateAddr.do" method="post">
                            <div class="address myInfo-content__value">
                                <input type="text" name="m_addr" value="${myinfo.m_addr }">
                            </div>
                            <div class="address myInfo-content__change">
                                <button type="submit">변경</button>
                            </div>
                            </form>
                        </div>
                        <!--변경 버튼 누르면 .myInfo-content__value, .myInfo-content__change 대신 출력됨-->
                        <div class="change-address change-content-container">
                            <div class="change-address change-content">
                                변경할 주소를 입력하세요.
                            </div>
                            <div class="change-address change-form">
                                <!--주소 찾기 API-->
                                <button class="small-button">주소 찾기</button>
                                <input type="text">
                                <input type="text">
                                <input type="text">
                            </div>
                            <div class="change-address change-buttons-container">
                                <button>변경하기</button>
                                <button>취소하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <footer id="footer-space"></footer>
    </div>
</body>
</html>