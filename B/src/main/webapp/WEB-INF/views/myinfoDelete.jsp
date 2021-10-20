<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 | 가구</title>
<link rel="stylesheet" href="./resources/css/base.css">
<link rel="stylesheet" href="./resources/css/mypage.css">
<link href="./resources/css/footer.css" rel="stylesheet"/>
<style>
.quit-confirm-container {
	border: 3px solid #eeded5;
	margin: 60px 10px;
	padding: 60px;
}

.quit-confirm-content {
	padding: 30px;
	font-size: large;
	font-weight: 500;
}

.quit-confirm-footer {
	text-align: right;
	margin-right: 60px;
}

.quit-confirm-footer button {
	width: 155px;
	padding: 14px;
	border-radius: 11px;
	font-size: 14pt;
	background: red;
}

.quit-confirm-footer button:hover {
	background: #403429;
}
</style>
<script type="text/javascript">
	function myAccountDelete() {
		if (confirm("정말 탈퇴하시겠습니까?")) {
			alert("계정 탈퇴 되었습니다.");
			return true;
		} else {
			alert("취소되었습니다.");
			return false;
		}
	}

	function move() {
		location.href = './main.do';
	}
</script>
</head>
<body>
<c:if test="${sessionScope.m_id eq null }">
	<c:redirect url="login.do" />
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
							<li class="sideMenu__item"><a href="">최근 본 상품</a></li>
							<li class="sideMenu__item"><a href="./mypage_point.do">적립금 조회</a></li>
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
					<h1>회원 탈퇴</h1>
				</div>
				<!--myPage 공통 부분 끝-->
				<div class="quit-confirm-container">
					<div class="quit-confirm-content">
						<p>탈퇴 시 모든 회원 정보가 삭제되며, 이는 복구할 수 없습니다.</p>
						<p>계속 진행하시겠습니까?</p>
					</div>
					<div class="quit-confirm-footer">
						<!--모달창 띄우기-->
						<form action="./myAccountDelete.do" method="post">
							<button onclick="return myAccountDelete()">탈퇴하기</button>
						</form>
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