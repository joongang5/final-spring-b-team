<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>   
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
    
    .checkbox{
    	
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

function linkPage(pageNo) {
	location.href = "./product.do?pageNo="
			+ pageNo
			+ "<c:if test="${search ne null}">&searchName=${searchName}&search=${search}</c:if>" +
			"<c:if test="${startDay ne null && endDay ne null}">&startDay=${startDay}&endDay=${endDay}</c:if>"+
			"<c:if test="${order ne null}">&order=${order}</c:if>";
}

$(document).ready(function(){
	
	$(".checkbox").click(function(){
		var arr = []
		$(".checkbox").each(function(){
			if($(this).is(":checked"))
			arr.push($(this).val())
			
			
		})

		 $('input[name=modify]').attr('value',arr)
			
	})
})
 
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
      
      
      <div class="admin-title">
        <h1>상품 목록</h1>
      </div>
      <form id="category-search-box" name="category-search-box" action="product.do" method="get">
      <div class="category-search-box">
        <!--클릭하면 기능 구동되는 걸루....ㅠㅠㅠㅠ-->
        <label>
        <p>카테고리로 검색</p>
          <select id="cMainSelected" class="search-select" name="cMainSelected" onchange="selectMain(this)">
            <option>1차 카테고리</option> 
            <c:forEach items="${categoryMain}" var="ca">
            <option value="${ca.c_main}">${ca.c_main }</option>            
            </c:forEach>
          </select>
          <select id="cSubSelected"   class="search-select" name="cSubSelected">
            <option>2차 카테고리</option>
          </select>
        </label>
        <button type="submit">검색</button>  <button onclick="location.href='./product.do'">초기화</button>
      </div>
      </form>
      
      <div class="keyword-search-box">
        <label for="keyword-search__word">
            <p>키워드 검색</p>
        </label>
        <form action="product.do" method="get">
        <div class="keyword-search__bar">
          <select id="keyword-search__column" name="searchName">
            <option value="p_no"<c:if test="${searchName eq 'p_no'}">selected="selected"</c:if>>상품 번호</option>
            <option value="p_title"<c:if test="${searchName eq 'p_title'}">selected="selected"</c:if>>상품명</option>
          </select>  <input type="text" id="keyword-search__word" name="search"<c:if test="${search ne null }">value=${search }</c:if>>
        	<button type="submit" class="search-button">검색</button>
        </div>
        </form>
      </div>
      
      
      <div class="selects-container">
      
       <form action="productModify.do" method="post">
        <div class="change-displayState-box">
          <label>
          	<p>선택한 상품</p>
            <select id="change-displayState" class="search-select" name="p_state">
              <option value="1">표시</option>
              <option value="0">비표시</option>
            </select>
            <input type="hidden" id="modify"  value="" name="modify">
          </label>
          <button type="submit" class="search-button">일괄 변경</button>
        </div>
          </form>
          
          
        <div class="sort-box">
          <select id="sort__by-column">
            <option>상품 번호순</option>
            <option>상품명순</option>
            <option>상품 가격순</option>
            <option>재고순</option>
            <option>등록일순</option>
            <option>표시 상태순</option>
          </select>
        </div>
      </div>
      <div class="productList-container">
        <table class="list-table productList" >
          <thead>      
          <tr>
			<th scope="col" >선택</th>
		 	<th scope="col">상품번호</th>
			<th colspan="2" scope="col">상품</th>
			<th scope="col">상품가격</th>
			<th scope="col">재고</th>
			<th scope="col">등록일자</th>
			<th scope="col">상위카테고리</th>
			<th scope="col">하위카테고리</th>
			<th scope="col">상품이미지</th>
			<th scope="col">
              <select id="sort__by-saleState">
                <option>판매 상태</option>
                <option>표시</option>
                <option>판매 중단</option>
                <option>품절</option>
              </select>
            </th>
            <th scope="col">표시 상태</th>
		
			
		</tr>
		<c:if test="${empty categorySearch }">
		<c:forEach items="${productList}" var="p">
		<tr>
			<td scope="col"><input type="checkbox" class="checkbox" value="${p.p_no}"></td>
			<td scope="col">${p.p_no }</td>
			<td colspan="2"><a href="./productDetail.do?p_no=${p.p_no}"> ${p.p_title} </a></td>
			<td scope="col">${p.p_price }</td>
			<td scope="col">${p.p_cnt }</td>
			<td scope="col">${p.p_date }</td>
			<td scope="col">${p.c_main }</td>
			<td scope="col">${p.c_sub }</td>
			<td scope="col"><c:if test="${p.p_no lt 58 }"><img src="https://blogger.googleusercontent.com/img/a/${p.p_img}" style="width:100px;height:100px;"></c:if>
							<c:if test="${p.p_no ge 58 }"><img src="./resources/uploadFile/${p.p_img}"style="width:100px;height:100px;"></c:if>
			</td>
			<td scope="col"> <c:if test="${p.p_state eq 1}"> 판매중 </c:if>
			<c:if test="${p.p_state eq 0 }">
			 판매 중단</c:if> </td>
			<td scope="col"> <c:if test="${p.p_state eq 1}"> 표시 </c:if>
			<c:if test="${p.p_state eq 0 }">
			 미표시</c:if> </td>
			
			
			
		</tr>
		</c:forEach>
		</c:if>
		
		<c:if test="${!empty categorySearch }">
		<c:forEach items="${categorySearch }" var="cs">
		<tr>
			<td><input type="checkbox" class="checkbox" value="${p_pno}"></td>
			<td>${cs.p_no }</td>
			<td>${cs.p_date }</td>
			<td>${cs.c_main }</td>
			<td>${cs.c_sub }</td>
			<td>${cs.p_title}</td>
			<td>${cs.p_price }</td>
			<td>${cs.p_cnt }</td>
			<td><img src="https://blogger.googleusercontent.com/img/a/${cs.p_img}" style="width:100px;height:100px;"></td>
			<td><c:if test="${cs.p_state eq 1}"> 판매중</c:if>
			 <c:if test="${cs.p_state eq 0 }"> 판매 중단 </c:if></td>
			<td> <c:if test="${cs.p_state eq 1}"> 판매</c:if>
			 <c:if test="${cs.p_state eq 0 }"> 미판매 </c:if></td>
		</tr>
		
		</c:forEach>	
		</c:if>
		
          
          
          
      
          <!--상품 목록 출력 끝-->
          </tbody>
        </table>
        <c:if test="${empty categorySearch }">
        <div class="paging productList__paging">
          <ui:pagination paginationInfo="${paginationInfo }" type="text" jsFunction="linkPage" />
      </div>
     </c:if>
   
  </div>
  <footer id="admin-footer"></footer>	
 	

</body>
</html>