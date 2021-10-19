<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet" href="./resources/css/base.css">
<link rel="stylesheet" href="./resources/css/admin2.css">
<style>
	.productDetail {
	}
	
	.productDetail tr{
		height: 60px;
	}
	
	.productDetail th{
        width: 50px;
	}
	
	.productDetail td{
		text-align: left;
        padding-left: 10px;
	}
	
	.productDetail tr:nth-child(10){
	}
	
	.productDetail tr:nth-child(10) th{
	}
	
	.productDetail tr:nth-child(10) td{
	    width: 300px;
    	height: 300px;
    	overflow: hidden;
	}
	
	.productDetail tr:nth-child(10) img{
	 	width: 300px;
    	height: 300px;
    	object-fit: cover;
    }
	
	.productDetail input[type="text"] {
        width: 94%;
	}

    .productDetail tr:first-child input[type="text"] {
    	width: 10%;
    }
    
    .productDetail-buttons-container{
		margin-top: 15px;
		text-align: center;
    }

	.productDetail-buttons-container button{
		width: 120px;
        height: 50px;
        font-size: 14pt;
        border-radius: 12px;
        margin: 0 10px;
	}
</style>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function deleteProduct() {
		var p_no = $("#p_no").val()
		if (confirm("정말 해당 제품을 삭제하시겠습니까?") == true) {
			del(p_no)

		} else {
			location.href = "./product.do"
		}

	}

	function del(p_no) {
		var r = p_no
		$.ajax({
			url : "deleteProduct.do",
			type : "post",
			data : {
				"p_no" : r
			},
			success : function(data) {
				alert("삭제했습니다.")
			},

		})
	}
</script>
<body>
	<!--admin 공통 부분-->
<header id="admin-header">
  <c:import url="/adminHeader.do"/>
</header>
	<div id="layout-container">
		<div id="admin-main-container">
			<nav id="admin-sideMenu">
				<div class="sideMenu__block-container">
					<ul class="sideMenu__items">
						<li class="sideMenu__item">
							<div class="sideMenu-container">
								<div>
									<img src="./resources/images/setting.png">
								</div>
								<div>
									<a href="./index.do">홈으로</a>
								</div>
							</div>
						</li>
						<li class="sideMenu__item">
							<div class="sideMenu-container">
								<div>
									<img src="./resources/images/delivery.png">
								</div>
								<div>
									<a href="">주문 관리</a>
								</div>
							</div>
							<div class="sideMenu-sub-container">
								<ul class="sideMenu__subItems">
									<li class="sideMenu__subItem"><a href="">주문 목록</a></li>
									<li class="sideMenu__subItem"><a href="">교환 관리</a></li>
									<li class="sideMenu__subItem"><a href="">환불 관리</a></li>
								</ul>
							</div>
						</li>
						<li class="sideMenu__item sideMenu__item--active">
							<div class="sideMenu-container">
								<div>
									<img src="./resources/images/furniture.png">
								</div>
								<div>
									<a href="./product.do">상품 관리</a>
								</div>
							</div>
							<div class="sideMenu-sub-container">
								<ul class="sideMenu__subItems sideMenu__subItems--active">
									<li class="sideMenu__subItem sideMenu__subItem--active"><a
										href="./product.do">상품 목록</a></li>
									<li class="sideMenu__subItem"><a
										href="./registerProduct.do">상품 등록</a></li>
								</ul>
							</div>
						</li>
						<li class="sideMenu__item">
							<div class="sideMenu-container">
								<div>
									<img src="./resources/images/user.png">
								</div>
								<div>
									<a href="./adminMember.do">고객 관리</a>
								</div>
							</div>
							<div class="sideMenu-sub-container">
								<ul class="sideMenu__subItems">
									<li class="sideMenu__subItem"><a href="./adminMember.do">회원 목록</a></li>
								</ul>
							</div>
						</li>
						<li class="sideMenu__item">
							<div class="sideMenu-container">
								<div>
									<img src="./resources/images/support.png">
								</div>
								<div>
									<a href="">고객 응대</a>
								</div>
							</div>
							<div class="sideMenu-sub-container">
								<ul class="sideMenu__subItems">
									<li class="sideMenu__subItem"><a href="">상품 문의 목록</a></li>
									<li class="sideMenu__subItem"><a href="">1:1 문의 목록</a></li>
									<li class="sideMenu__subItem"><a href="">자주 묻는 질문 관리</a></li>
									<li class="sideMenu__subItem"><a href="">리뷰 목록</a></li>
								</ul>
							</div>
						</li>
						<li class="sideMenu__item">
							<div class="sideMenu-container">
								<div>
									<img src="./resources/images/browser.png">
								</div>
								<div>
									<a href="./adminLog.do">사이트 관리</a>
								</div>
							</div>
							<div class="sideMenu-sub-container">
								<ul class="sideMenu__subItems">
									<li class="sideMenu__subItem"><a href="./adminLog.do">로그 조회</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</nav>
			<main>
				<!--admin 공통 부분 끝-->

				<div class="admin-title">
					<h1>상품 상세</h1>
				</div>

				<div class="productDetail-container">
					<form action="productDetail.do" method="post">
						<table class="productDetail">

							<tr>
								<th>상품 번호</th>
								<td><input type="number" id="p_no" name="p_no"
									value="${detail.p_no}"></td>
							</tr>

							<tr>
								<th>등록 일자</th>
								<td>${detail.p_date}</td>
							</tr>
							<tr>
								<th>상위 카테고리</th>
								<td>${detail.c_main}</td>
							</tr>
							<tr>
								<th>하위 카테고리</th>
								<td>${detail.c_sub}</td>
							</tr>
							<tr>
								<th>상품명</th>
								<td><input type="text" name="p_title"
									value="${detail.p_title}"></td>
							</tr>
							<tr>
								<th>상품 가격</th>
								<td><input type="text" name="p_price" value="${detail.p_price}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
							</tr>
							<tr>
								<th>총 재고 수</th>
								<td><input type="number" name="p_cnt" value="${detail.p_cnt}"></td>
							</tr>
							<tr>
								<th>판매 상태</th>
								<td><c:if test="${detail.p_state eq 1 }">판매</c:if> <c:if
										test="${detail.p_state eq 0 }">미판매</c:if></td>
							</tr>
							<tr>
								<th>표시 상태</th>
								<td><c:if test="${detail.p_state eq 1 }">표시</c:if> <c:if
										test="${detail.p_state eq 0 }">미표시</c:if></td>
							</tr>
							<tr>
								<th>썸네일</th>
								<td> <c:if test="${detail.p_no lt 58 }">
								<img src="https://blogger.googleusercontent.com/img/a/${detail.p_img}"></c:if>
								<c:if test="${detail.p_no ge 58 }">
								 <img src="./resources/uploadFile/${detail.p_img}">
								</c:if>	
								
									
									</td>
							</tr>


						</table>
						<div class="productDetail-buttons-container">
							<button type="submit">수정</button>
							<button onclick="deleteProduct()">삭제</button>
						</div>
					</form>
					<footer id="admin-footer"></footer>
				</div>
</body>
</html>
