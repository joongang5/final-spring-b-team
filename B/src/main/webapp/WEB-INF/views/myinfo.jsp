<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 | 가구</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function DaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				let addr = ''; // 주소 변수
				let extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있을 때 추가 (-공동주택일 경우에만 추가하는 건 일단 제외)
					if (data.buildingName !== '') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("detailAddress").value = extraAddr;

				} else {
					document.getElementById("detailAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}
	
	function openChange(divName) {
		Array.from(document.getElementsByClassName(divName)).forEach(function(val) {
	    	val.style.display = "block";
	    })
	 }
	 
	 function closeChange(divName) {
		 Array.from(document.getElementsByClassName(divName)).forEach(function(val) {
		    	val.style.display = "none";
		    })
	 }
	 
		function myAddressUpdate() {
			if (confirm("정말 수정하시겠습니까?")) {
				alert("수정되었습니다.");
				return true;
			} else {
				return false;
			}
		}

		function myPhoneUpdate() {
			if (confirm("정말 휴대전화 번호를 수정하시겠습니까?")) {
				alert("수정되었습니다.");
				return true;
			} else {
				return false;
			}
		}

		function myEmailUpdate() {
			if (confirm("정말 이메일 주소를 수정하시겠습니까?")) {
				alert("수정되었습니다.");
				return true;
			} else {
				return false;
			}
		}
</script>
<link rel="stylesheet" href="./resources/css/base.css">
<link rel="stylesheet" href="./resources/css/mypage.css">
<style>
.myInfo-container {
	
}

.myInfo-body {
	border: 5px solid #eeded5;
	padding: 40px;
}

.myInfo-content__short-container {
	display: flex;
	padding: 5px 0;
	justify-content: flex-start;
	font-size: 13pt;
	align-items: center;
	min-height: 50px;
}

.myInfo-content__section {
	width: 20%;
	/* font-size: larger; */
	font-weight: 600;
	border-right: 2px solid #e5e5e5;
	text-align: right;
	padding-right: 10px;
}

.myInfo-content__value {
	width: 60%;
	margin: 0 19px 0 20px;
}

.myInfo-content__change {
	width: 15%;
	text-align: center;
}

.myInfo-content__change button {
	width: 100px;
	padding: 10px;
	border-radius: 10px;
	font-size: 12pt;
}

.phoneNo {
	
}

.change-content-container {
	padding: 10px 0 10px 20px;
	margin-left: 20%;
	font-size: 13pt;
}

.change-content {
	margin-bottom: 15px;
}

.change-form {
	
}

.changePhoneNo {
	display: none;
}

.changePhoneNo input[type="tel"] {
	width: 275px;
}

.change-buttons-container {
	text-align: right;
	margin: 10px 10px 0 0;
}

.change-buttons-container button {
	padding: 10px;
	width: 110px;
	border-radius: 10px;
	font-size: 12pt;
}

.email-address {
	
}

.changeEmail {
	display: none;
}

.changeEmail input[type="email"] {
	width: 330px;
}

.changeAddress {
	display: none;
}

.changeAddress .small-button {
	height: 37px;
	width: 110px;
	font-size: 11pt;
}

.changeAddress input[type="text"] {
	display: block;
	margin-bottom: 10px;
}

.changeAddress input[type="text"]:nth-child(2) {
	display: inline;
	width: 100px;
}

.changeAddress input[type="text"]:nth-child(3) {
	width: 500px;
}

.changeAddress input[type="text"]:nth-child(4) {
	width: 500px;
}

</style>
</head>
<body>
	<!--myPage 공통 부분-->
	<div id="layout-container">
		<header id="header-space">
		</header>
		<div id="myPage-main-container">
			<nav id="myPage-sideMenu">
				<div class="sideMenu__block-container">
					<div class="sideMenu__block">
						<h3>나의 쇼핑 활동</h3>
						<ul class="sideMenu__items">
							<li class="sideMenu__item"><a href="./orderhistory1.do">구매
									내역 조회</a></li>
							<li class="sideMenu__item"><a href="">최근 본 상품</a></li>
							<li class="sideMenu__item"><a href="">쿠폰 / 적립금 조회</a></li>
							<li class="sideMenu__item"><a href="">상품 문의</a></li>
							<li class="sideMenu__item"><a href="">1:1 문의</a></li>
						</ul>
					</div>
					<div class="sideMenu__block">
						<h3>회원 정보</h3>
						<ul class="sideMenu__items">
							<li class="sideMenu__item sideMenu__item--active"><a href="./myinfo.do">회원 정보
									조회</a></li>
							<li class="sideMenu__item"><a href="">주소록</a></li>
							<li class="sideMenu__item"><a href="./myinfoUpdatePW.do">비밀번호
									변경</a></li>
							<li class="sideMenu__item"><a
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
							<div class="unchangeable myInfo-content__section">아이디</div>
							<div class="unchangeable myInfo-content__value">
								<span>${myinfo.m_id }</span>
							</div>
						</div>
						<div class="myInfo-content__short-container">
							<div class="unchangeable myInfo-content__section">이름</div>
							<div class="unchangeable myInfo-content__value">
								<span>${myinfo.m_name }</span>
							</div>
						</div>
						<div class="myInfo-content__short-container">
							<div class="phoneNo myInfo-content__section">휴대전화</div>
								<div class="phoneNo myInfo-content__value">
									<span>${myinfo.m_phone }</span>
								</div>
								<div class="phoneNo myInfo-content__change">
									<button onclick="openChange('changePhoneNo')">변경</button>
								</div>
						</div>
						<!--변경 버튼 누르면 .myInfo-content__value, .myInfo-content__change 대신 출력됨-->
						<div class="changePhoneNo change-content-container">
							<div class="changePhoneNo change-content">변경할 휴대폰 번호를
								입력하세요.</div>
							<div class="changePhoneNo change-form">
							<form action="./myinfoUpdatePhone.do" method="post">
								<input type="text" name="m_phone" value="${myinfo.m_phone }">
							</div>
							<div class="changePhoneNo change-buttons-container">
								<button type="submit" onclick="return myPhoneUpdate()">변경하기</button>
								<button type="reset" onclick="closeChange('changePhoneNo')">취소하기</button>
							</form>
							</div>
						</div>
						<div class="myInfo-content__short-container">
							<div class="email-address myInfo-content__section">이메일 주소</div>
								<div class="email-address myInfo-content__value">
									<span>${myinfo.m_email}</span>
								</div>
								<div class="email-address myInfo-content__change">
									<button onclick="openChange('changeEmail')">변경</button>
								</div>
						</div>
						<!--변경 버튼 누르면 .myInfo-content__value, .myInfo-content__change 대신 출력됨-->
						<div class="changeEmail change-content-container">
							<div class="changeEmail change-content">변경할 이메일 주소를 입력하세요.
							</div>
							<div class="changeEmail change-form">
							<form action="./myinfoUpdateEmail.do" method="post">
								<input type="email" name="m_email" value="${myinfo.m_email}">
							</div>
							<div class="changeEmail change-buttons-container">
								<button type="submit" onclick="return myEmailUpdate()">변경하기</button>
								<button type="reset" onclick="closeChange('changeEmail')">취소하기</button>
							</form>
							</div>
						</div>
						<div class="myInfo-content__short-container">
							<div class="address myInfo-content__section">주소</div>
								<div class="address myInfo-content__value">
									<span>(${myinfo.m_addr1}) ${myinfo.m_addr2} ${myinfo.m_addr3}</span>
								</div>
								<div class="address myInfo-content__change">
									<button onclick="openChange('changeAddress')">변경</button>
								</div>
						</div>
						<!--변경 버튼 누르면 .myInfo-content__value, .myInfo-content__change 대신 출력됨-->
						<div class="changeAddress change-content-container">
								<div class="changeAddress change-content">변경할 주소를 입력하세요.
								</div>
								<div class="changeAddress change-form">
									<!--주소 찾기 API-->
									<!-- <button class="small-button">주소 찾기</button> -->
									<form action="./myinfoUpdateAddr2.do" method="post">
									<button type="button" class="small-button"
										onclick="DaumPostcode()">주소 찾기</button>
									<input type="text" id="postcode" name="postcode"
										placeholder="우편 번호" readonly="readonly" value="${myinfo.m_addr1}">
									<input type="text" id="address" name="address" placeholder="주소" value="${myinfo.m_addr2}">
									<input type="text" id="detailAddress" name="detailAddress"
										placeholder="상세 주소" value="${myinfo.m_addr3}">
								</div>
								<div class="changeAddress change-buttons-container">
									<button type="submit" onclick="return myAddressUpdate()">변경하기</button>
									<button type="reset" onclick="closeChange('changeAddress')">취소하기</button>
									</form>
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