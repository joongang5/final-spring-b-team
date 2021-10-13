<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 | 가구</title>
<link rel="stylesheet" href="./resources/css/base.css">
<link rel="stylesheet" href="./resources/css/admin.css">
<style>
    .category-search-box{
      margin-bottom: 10px;
    }

    .category-search-box label{

    }

    .category-search-box select{
      /* background: #eeded5; */
      width: 200px;
      padding: 8px 14px;
    }

    .selects-container{

    }

    .change-displayState-box{
      margin-bottom: 10px;
    }

    .change-displayState-box label{

    }

    #change-displayState{

    }

    .change-displayState-box button{

    }

    .productList-container{

    }

    .productList{
      /* border: 1px solid black; */
      /* border-collapse: collapse; */
    }

    .productList th:nth-child(3){

    }

    .productList th:nth-child(7){

    }

    .product-thumbnail-td{
      width: 50px;
      height: 50px;
      overflow: hidden;
    }


    .product-thumbnail-td img{
      width: 100%;
      object-fit: cover;
    }

    #sort__by-saleState{

    }

    .productList td{
      font-size: 10pt;
    }

    .productList__paging {

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
<div id="layout-container">
  <header id="admin-header"></header>
  <div id="admin-main-container">
    <nav id="admin-sideMenu">
      <div class="sideMenu__block-container">
        <ul class="sideMenu__items">
          <li class="sideMenu__item">
            <div class="sideMenu-container">
              <div><img src="./resources/images/setting.png" style="height:30px;width:30px;"></div>
              <div><a href="./index.do">홈으로</a></div>
            </div>
          </li>
          <li class="sideMenu__item">
            <div class="sideMenu-container">
              <div><img src="./resources/images/delivery.png" style="height:30px;width:30px;"></div>
              <div><a href="">주문 관리</a></div>
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
              <div><img src="./resources/images/furniture.png" style="height:30px;width:30px;"></div>
              <div><a href="./product.do">상품 관리</a></div>
            </div>
            <div class="sideMenu-sub-container">
              <ul class="sideMenu__subItems sideMenu__subItems--active">
                <li class="sideMenu__subItem sideMenu__subItem--active"><a href="./product.do">상품 목록</a></li>
                <li class="sideMenu__subItem"><a href="./registerProduct.do">상품 등록</a></li>
              </ul>
            </div>
          </li>
          <li class="sideMenu__item">
            <div class="sideMenu-container">
              <div><img src="./resources/images/user.png" style="height:30px;width:30px;"></div>
              <div><a href="">고객 관리</a></div>
            </div>
            <div class="sideMenu-sub-container">
              <ul class="sideMenu__subItems">
                <li class="sideMenu__subItem"><a href="">회원 목록</a></li>
              </ul>
            </div>
          </li>
          <li class="sideMenu__item">
            <div class="sideMenu-container">
              <div><img src="./resources/images/support.png" style="height:30px;width:30px;"></div>
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
              <div><img src="./resources/images/browser.png" style="height:30px;width:30px;"></div>
              <div><a href="">사이트 관리</a></div>
            </div>
            <div class="sideMenu-sub-container">
              <ul class="sideMenu__subItems">
                <li class="sideMenu__subItem"><a href="">로그 조회</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </div>
    </nav>
    <main>
      <!--admin 공통 부분 끝-->
      
<h1>상품 등록</h1>
<form action="fileUpload.do" method ="post" enctype="multipart/form-data" id="uploadForm">	
<label>상품대표사진 <br>
<input id="p_img" name= "p_img"  type="file" accept="image/*"  >
</label>
<button type="submit">업로드</button> 
</form> 

<c:if test="${sessionScope.p_img ne null }">
<label>미리보기</label> <br>
<img alt="미리보기" src="./resources/uploadFile/${sessionScope.p_img }" style="width:200px;height:200px;">
 <button onclick="location.href='./removeImgSession.do'">이미지 삭제</button> <br>
</c:if>

<form action="registerProduct.do" method="post">
<div class="register"> 

<label> 상품명 <br>
<input type="text" id="p_title" name="p_title" required></label>
<br><br>
<label>가격 <br>
<input type="text" id="p_price" name="p_price" required></label>
<br><br>
<label>재고량 <br>
<input type="text" id="p_cnt" name="p_cnt" required></label>
 <br><br>
<label> 상품 카테고리 선택 <br>
<select id="cMainSelected" name="cMainSelected" onchange="selectMain(this)" required>
            <option>1차 카테고리</option> 
            <c:forEach items="${categoryMain}" var="ca">
            <option value="${ca.c_main}">${ca.c_main }</option>            
            </c:forEach>
          </select>
          <select id="cSubSelected" name="cSubSelected" onchange="selectSub(this)" required>
            <option>2차 카테고리</option>
          </select>
          <input type="hidden" id="c_no" name="c_no" value=""> 
        </label>
        
 <br><br>       
 <button type="submit">등록</button>    
</div> 
</form>       
</body>

</html>