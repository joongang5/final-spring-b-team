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
function deleteProduct(){
	var p_no = $("#p_no").val()
	if(confirm("정말 해당 제품을 삭제하시겠습니까?") == true){
			del(p_no)
		
	}else{
		location.href="./product.do"
	}
	
}

function del(p_no){
	var r = p_no
	 $.ajax({
			url : "deleteProduct.do",
			type : "post",
			data : {"p_no" : r},
			success : function(data) {
				alert("삭제했습니다.")
			},

		})
}

</script>
<body>
<h1>상품 상세</h1>
            
            <div class="productDetail-buttons-container">
            </div>
            <div class="productDetail-container">
            <form action="productDetail.do" method="post">
                <table class="productDetail">
                
                    <tr>
                        <th scope="row">상품 번호</th>
                        <td><input type="text" id="p_no" name="p_no" value="${detail.p_no}"> </td>
                    </tr>
                    <tr>
                        <th scope="row">등록 일자</th>
                        <td>${detail.p_date}</td>
                    </tr>
                    <tr>
                        <th scope="row">상위 카테고리</th>
                        <td>${detail.c_main}</td>
                    </tr>
                    <tr>
                        <th scope="row">하위 카테고리</th>
                        <td>${detail.c_sub}</td>
                    </tr>
                    <tr>
                        <th scope="row">상품명</th>
                        <td><input type="text" name="p_title" value="${detail.p_title}"></td>
                    </tr>
                    <tr>
                        <th scope="row">상품 가격</th>
                        <td><input type="text" name="p_price" value="${detail.p_price}"></td>
                    </tr>
                    <tr>
                        <th scope="row">총 재고 수</th>
                        <td><input type="text" name="p_cnt" value="${detail.p_cnt}"></td>
                    </tr>
                    <tr>
                        <th scope="row">판매 상태</th>
                        <td><c:if test="${detail.p_state eq 1 }">판매</c:if>
                        	<c:if test="${detail.p_state eq 0 }">미판매</c:if>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">표시 상태</th>
                        <td><c:if test="${detail.p_state eq 1 }">표시</c:if>
                        	<c:if test="${detail.p_state eq 0 }">미표시</c:if></td>
                    </tr>
                    <tr>
                        <th scope="row">썸네일</th>
                        <td><img src="https://blogger.googleusercontent.com/img/a/${detail.p_img}" style="width:200px;height:200px;"></td>
                    </tr>
            
                    
                </table>
                <button type="submit">수정</button>  <button onclick="deleteProduct()">삭제</button>
                </form>
                </div>
</body>
</html>
