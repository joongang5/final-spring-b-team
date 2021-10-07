<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
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
<h1>상품 등록</h1>
<form action="registerProduct.do" method="post">
<div class="register"> 

<label> 상품명 <br>
<input type="text" id="p_title" name="p_title"></label>
<br><br>
<label>가격 <br>
<input type="text" id="p_price" name="p_price"></label>
<br><br>
<label>상품대표사진 <br>
<input type="text" id="p_img" name="p_img"></label>
<br><br>
<label>재고량 <br>
<input type="text" id="p_cnt" name="p_cnt"></label>
 <br><br>
<label> 상품 카테고리 선택 <br>
<select id="cMainSelected" name="cMainSelected" onchange="selectMain(this)">
            <option>1차 카테고리</option> 
            <c:forEach items="${categoryMain}" var="ca">
            <option value="${ca.c_main}">${ca.c_main }</option>            
            </c:forEach>
          </select>
          <select id="cSubSelected" name="cSubSelected" onchange="selectSub(this)">
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