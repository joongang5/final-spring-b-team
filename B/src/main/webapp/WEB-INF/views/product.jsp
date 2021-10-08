<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
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
      <div class="admin-title">
        <h1>상품 목록</h1>
      </div>
      <form id="category-search-box" name="category-search-box" action="product.do" method="get">
      <div class="category-search-box">
        <!--선택하면 바로 이동됨-->
        <label>카테고리로 검색
          <select id="cMainSelected" name="cMainSelected" onchange="selectMain(this)">
            <option>1차 카테고리</option> 
            <c:forEach items="${categoryMain}" var="ca">
            <option value="${ca.c_main}">${ca.c_main }</option>            
            </c:forEach>
          </select>
          <select id="cSubSelected" name="cSubSelected">
            <option>2차 카테고리</option>
          </select>
        </label>
        <button type="submit">검색</button>  <button onclick="location.href='./product.do'">초기화</button>
      </div>
      </form>
      
      <div class="keyword-search-box">
        <label for="keyword-search__word">키워드 검색</label>
        <form action="product.do" method="get">
        <div class="keyword-search__bar">
          <select id="searchName" name="searchName">
            <option value="p_no"<c:if test="${searchName eq 'p_no'}">selected="selected"</c:if>>상품 번호</option>
            <option value="p_title"<c:if test="${searchName eq 'p_title'}">selected="selected"</c:if>>상품명</option>
          </select>  <input type="text" name="search"<c:if test="${search ne null }">value=${search }</c:if>>
        	<button type="submit">검색</button>
        </div>
        </form>
      </div>
      <div class="selects-container">
      
       <form action="productModify.do" method="post">
        <div class="change-displayState-box">
          <label>선택한 상품
            <select id="p_state" name="p_state">
              <option value="1">표시</option>
              <option value="0">비표시</option>
            </select>
            <input type="hidden" id="modify"  value="" name="modify">
          </label>
          <button type="submit">일괄 변경</button>
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
        <table class="productList" border="1">
          <thead>
          </thead>
          <tbody>
          <!--상품 목록 출력 / 반복문 사용-->
          
          <tr>
			<th>선택</th>
		 	<th>상품번호</th>
			<th>등록일자</th>
			<th>상위카테고리</th>
			<th>하위카테고리</th>
			<th>상품명</th>
			<th>상품가격</th>
			<th>재고</th>
			<th>상품이미지</th>
			<th scope="col">
              <select id="sort__by-saleState">
                <option>판매 상태</option>
                <option>판매중</option>
                <option>판매 중단</option>
                <option>품절</option>
              </select>
            </th>
            <th scope="col">표시 상태</th>
		
			
		</tr>
		<c:if test="${empty categorySearch }">
		<c:forEach items="${productList}" var="p">
		<tr>
			<td><input type="checkbox" class="checkbox" value="${p.p_no}"></td>
			<td>${p.p_no }</td>
			<td>${p.p_date }</td>
			<td>${p.c_main }</td>
			<td>${p.c_sub }</td>
			<td><a href="./productDetail.do?p_no=${p.p_no}"> ${p.p_title} </a></td>
			<td>${p.p_price }</td>
			<td>${p.p_cnt }</td>
			<td><img src="https://blogger.googleusercontent.com/img/a/${p.p_img}" style="width:100px;height:100px;"></td>
			<td> <c:if test="${p.p_state eq 1}"> 판매중 </c:if>
			<c:if test="${p.p_state eq 0 }">
			 판매 중단</c:if> </td>
			<td> <c:if test="${p.p_state eq 1}"> 표시 </c:if>
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
        <div class="productList__paging">
          <ui:pagination paginationInfo="${paginationInfo }" type="text" jsFunction="linkPage" />
      </div>
     </c:if>
   
  </div>
  <footer id="footer-space"></footer>


   <div class="registerProduct">
   		<a href="./registerProduct.do"> 상품 등록 </a>
   </div>	
 	

</body>
</html>