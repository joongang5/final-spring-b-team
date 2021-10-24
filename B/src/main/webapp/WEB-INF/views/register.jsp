<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 | Spring.B</title>
<link rel="stylesheet" href="./resources/css/base.css">
<link rel="stylesheet" href="./resources/css/admin.css">
<style>
	.productRegister {
	}
	
	.productRegister tr{
		height: 60px;
	}
	
	.productRegister th{
        width: 50px;
	}
	
	.productRegister td{
		text-align: left;
        padding-left: 10px;
	}
	
	.productRegister tr:first-child{
	}
	
	.productRegister tr:first-child th{
	}
	
	.productRegister tr:first-child td{
	    width: 300px;
    	height: 300px;
    	overflow: hidden;
	}
	
	.thumbnailRegister {
		width: 80px;
		height: 35px;
		font-size: 12pt;
		border-radius: 8px;
	}

	.thumbnaildelete {
		width: 111px;
		height: 35px;
		font-size: 12pt;
		border-radius: 8px;
		background: white;
		border: 1px solid #FF8A00;
		color: #FF8A00;
		transiton:0;
	}

	.thumbnaildelete:hover {
		background: white;
		border: 2px solid #FF8A00;
	}
	
	.productRegister select {
      background-color: #eeded5;
	  width: 240px;
	 padding: 11px 14px;
	 border-radius: 9px;
    }
    
    input[type="file"] {
    margin: 15px 15px 15px 0;
    }
   
	
	.productRegister input[type="text"] {
        width: 94%;
	}
    
    .productRegister tr:nth-child(6) input[type="text"] {
    	width: 21%;
    }
    
    .productRegister-buttons-container{
		margin-top: 15px;
		text-align: center;
    }

	.productRegister-buttons-container button{
		width: 120px;
        height: 50px;
        font-size: 14pt;
        border-radius: 12px;
        margin: 0 10px;
	}
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
 function selectMain(c_main){
	 var real_c_main = c_main.value
	 
	 $.ajax({
			url : "categoryMain.do",
			type : "post",
			data : {"real_c_main" : real_c_main},
			success : function(data) {
				sub(data)
			},

		})
 }
 
function sub(data){
	var sub = data;
	
	$("#cSubSelected").empty();
	$("#cSubSelected").append($("<option>" + "2차 카테고리" + "</option>"))
	for(var i = 0; i<sub.length; i++){
		var option = $("<option>"+ sub[i] + "</option>")
		$("#cSubSelected").append(option)
	}
	
}

function selectSub(c_sub){
	var c_main = $("#cMainSelected").val()
	var real_c_sub = c_sub.value
	
	$.ajax({
		url : "searchCategoryNum.do",
		type : "post",
		data : {"c_main" : c_main , "c_sub" : real_c_sub},
		success : function(data){
			$('input[name=c_no]').attr('value',data)
		},
	})
}
</script>
<body>
<!--admin 공통 부분-->
<c:if test="${sessionScope.m_grade ne 1 }">
	<c:redirect url="login.do" />
</c:if>
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
              <div><img src="./resources/images/setting.png" ></div>
              <div><a href="./index.do">홈으로</a></div>
            </div>
          </li>
          <li class="sideMenu__item">
            <div class="sideMenu-container">
              <div><img src="./resources/images/delivery.png" ></div>
              <div><a href="./admin_orderList.do">주문 관리</a></div>
            </div>
            <div class="sideMenu-sub-container">
              <ul class="sideMenu__subItems">
                <li class="sideMenu__subItem"><a href="./admin_orderList.do">주문 목록</a></li>
                <li class="sideMenu__subItem"><a href="./admin_exchange.do">교환 관리</a></li>
           
              </ul>
            </div>
          </li>
          <li class="sideMenu__item sideMenu__item--active">
            <div class="sideMenu-container">
              <div><img src="./resources/images/furniture.png" ></div>
              <div><a href="./product.do">상품 관리</a></div>
            </div>
            <div class="sideMenu-sub-container">
              <ul class="sideMenu__subItems sideMenu__subItems--active">
                <li class="sideMenu__subItem"><a href="./product.do">상품 목록</a></li>
                <li class="sideMenu__subItem sideMenu__subItem--active"><a href="./registerProduct.do">상품 등록</a></li>
              </ul>
            </div>
          </li>
          <li class="sideMenu__item">
            <div class="sideMenu-container">
              <div><img src="./resources/images/user.png" ></div>
              <div><a href="./adminMember.do">고객 관리</a></div>
            </div>
            <div class="sideMenu-sub-container">
              <ul class="sideMenu__subItems">
                <li class="sideMenu__subItem"><a href="./adminMember.do">회원 목록</a></li>
              </ul>
            </div>
          </li>
          <li class="sideMenu__item">
            <div class="sideMenu-container">
              <div><img src="./resources/images/support.png" ></div>
              <div><a href="">고객 응대</a></div>
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
              <div><img src="./resources/images/browser.png" ></div>
              <div><a href="./adminLog.do">사이트 관리</a></div>
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
					<h1>상품 등록</h1>
				</div>

				<div class="productRegister-container">
						<table class="productRegister">
							<form action="fileUpload.do" method="post" enctype="multipart/form-data" id="uploadForm">	
							<tr>
								<th>썸네일</th>
								<td>
									<input id="p_img" name= "p_img" type="file" accept="image/*"><button type="submit" class="thumbnailRegister">업로드</button>
							</form> 
									<c:if test="${sessionScope.p_img ne null }">
									<br>
									<img alt="미리보기" src="./resources/uploadFile/${sessionScope.p_img }" style="width:300px;height:300px;">
									 <button onclick="location.href='./removeImgSession.do'" class="thumbnaildelete">이미지 삭제</button> <br>
									</c:if>
								</td>
							</tr>
							<form action="registerProduct.do" method="post">
							<tr>
								<th>1차 카테고리 선택</th>
								<td>
								<select id="cMainSelected" name="cMainSelected" onchange="selectMain(this)" required>
						            <option>1차 카테고리</option> 
						            <c:forEach items="${categoryMain}" var="ca">
						            <option value="${ca.c_main}">${ca.c_main }</option>            
						            </c:forEach>
					          </select>
								</td>
							</tr>
							<tr>
								<th>2차 카테고리 선택</th>
								<td>
								 <select id="cSubSelected" name="cSubSelected" onchange="selectSub(this)" required>
            					 <option>2차 카테고리</option>
          						</select>
          						<input type="hidden" id="c_no" name="c_no" value=""> 
								</td>
							</tr>
							<tr>
								<th>상품명</th>
								<td><input type="text" id="p_title" name="p_title" required></td>
							</tr>
							<tr>
								<th>상품 가격</th>
								<td><input type="text" id="p_price" name="p_price" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required></td>
							</tr>
							<tr>
								<th>재고량</th>
								<td><input type="number" id="p_cnt" name="p_cnt" required></td>
							</tr>
						</table>
						<div class="productRegister-buttons-container">
							 <button type="submit">등록</button>  
						</div>
					</form>
					<footer id="admin-footer"></footer>
				</div>
      
</body>

</html>