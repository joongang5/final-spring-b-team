<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
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
        <button type="submit">검색</button>
      </div>
      </form>
      <div class="keyword-search-box">
        <label for="keyword-search__word">키워드 검색</label>
        <div class="keyword-search__bar">
          <select id="keyword-search__column">
            <option>상품 번호</option>
            <option>상품명</option>
            <option>상품</option>
            <option>상품명</option>
          </select>
          <input type="search" id="keyword-search__word">
        </div>
        <button>검색</button>
      </div>
      <div class="selects-container">
        <div class="change-displayState-box">
          <label>선택한 상품
            <select id="change-displayState">
              <option>표시</option>
              <option>비표시</option>
            </select>
          </label>
          <button>일괄 변경</button>
        </div>
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
          <tr>
            <th scope="col">선택</th>
            <th scope="col">상품 번호</th>
            <th colspan="2" scope="col">상품</th>
            <th scope="col">상품 가격</th>
            <th scope="col">재고</th>
            <th scope="col">등록일자</th>
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
		
			
		</tr>
		<c:if test="${empty categorySearch }">
		<c:forEach items="${list}" var="l">
		<tr>
			<td><input type="checkbox"></td>
			<td>${l.p_no }</td>
			<td>${l.p_date }</td>
			<td>${l.c_main }</td>
			<td>${l.c_sub }</td>
			<td>${l.p_title}</td>
			<td>${l.p_price }</td>
			<td>${l.p_cnt }</td>
			<td><img src="https://blogger.googleusercontent.com/img/a/${l.p_img}" style="width:100px;height:100px;"></td>
		</tr>
		</c:forEach>
		</c:if>
		
		<c:if test="${!empty categorySearch }">
		<c:forEach items="${categorySearch }" var="cs">
		<tr>
			<td><input type="checkbox"></td>
			<td>${cs.p_no }</td>
			<td>${cs.p_date }</td>
			<td>${cs.c_main }</td>
			<td>${cs.c_sub }</td>
			<td>${cs.p_title}</td>
			<td>${cs.p_price }</td>
			<td>${cs.p_cnt }</td>
			<td><img src="https://blogger.googleusercontent.com/img/a/${cs.p_img}" style="width:100px;height:100px;"></td>
		</tr>
		
		</c:forEach>	
		</c:if>
		
          
          
          
      
          <!--상품 목록 출력 끝-->
          </tbody>
        </table>
        <div class="productList__paging"></div>
      </div>
    </main>
  </div>
  <footer id="footer-space"></footer>
</div>

 검색 <select> <option value="상품번호"  > 상품번호 </option>
			  <option value="상품명"> 상품명 </option>
			  <option value="상품가격"> 상품가격 </option>
			  <option value="재고"> 재고 </option>
			  <option value="등록일자">등록일자</option> 
 	</select>
 	

</body>
</html>