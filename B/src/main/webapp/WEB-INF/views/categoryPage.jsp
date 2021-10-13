<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring.B ${title } 페이지</title>
<link href="./resources/css/header.css" rel="stylesheet"/>
<link href="./resources/css/reset.css" rel="stylesheet"/>
<link href="./resources/css/footer.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
/* reset.css */
/* header.css */
/* footer.css */
/* container.css */	
#wrapper{width:100%;margin:0 auto;}
	#container{width:100%;padding-top:124px;padding-bottom:300px;}
		#mainContainer{width:100%;}
			#mainContainer .section{width:100%;margin: 0 auto;}
				#mainContainer .section .sector{width:1200px;margin:0 auto;}
					#mainContainer .section #category h2{height:40px;line-height:40px;padding:50px 0 10px 0;}
						#mainContainer .section #category h2 .sectorSelecter{border:1px solid #ccc;outline:none;padding:2px 9px;border-radius:15px;cursor:pointer;vertical-align:top;margin:9px 0 0 15px;}
					#mainContainer .section #category #subCategory{width:100%;padding-bottom:20px;border-bottom:1px solid #333; overflow:hidden;}
						#mainContainer .section #category #subCategory p{padding:2px 10px;border:1px solid #ccc;border-radius:10px;float:left;margin-right:15px;cursor:pointer;transition:0.3s all;}
						#mainContainer .section #category #subCategory p:hover{border:1px solid black;background-color:#eee;}
					#mainContainer .section #category #subCategory:after{content:"";display:block;clear:both;}
						
					/* 핀터레스트 레이아웃 https://opentutorials.org/course/2473/13712 , https://n-log.tistory.com/33 column-count:4;column-gap: 15px;*/
					#mainContainer .section #productList .product{width:100%; padding-top:15px;}
						#mainContainer .section #productList  .product .scene{width:24%;height:280px;border-radius:5px;overflow:hidden;position:relative;cursor:pointer;margin:0.5%;float:left;transition:0.3s all;}
							#mainContainer .section #productList  .product .scene .sceneImg{display:block;width:100%;height:100%;transition:0.3s all;}
							#mainContainer .section #productList  .product .scene .detail{width:100%;height:100px;background-color:rgba(0,0,0,0.6);position:absolute;bottom:-100px;left:0;color:#fff;transition:0.3s all;}
						/* #mainContainer .section #productList  .product .scene:hover .sceneImg{filter: blur(3px);} */
						#mainContainer .section #productList  .product .scene:hover .detail{bottom:0;}
						#mainContainer .section #productList  .product .scene:hover{box-shadow:0px 0px 10px 5px rgba(0,0,0,0.5);}
							#mainContainer .section #productList  .product .scene .detail .title{padding:10px 0 0 10px;font-size:14px;max-height:65px;overflow:hidden;}
							#mainContainer .section #productList  .product .scene .detail .price{padding:10px 5px 0 10px;font-size:12px;}
						
	#container:after{content:"";display:block;clear:both;}
</style>
<script>
$(function(){
	$("#category .optionSelect").val("${optionSelect}").prop("selected", true);
	$(".sectorSelecter").change(function(){
		var option = $(this).val();
		var category = "${param.category}";
		var sub = "${param.sub}";
		if(category == "" && sub == ""){
			location.href="./categoryPage.do?option="+option;
		}else if(category != "" && sub == ""){
			location.href="./categoryPage.do?category="+category+"&&option="+option;
		}else{
			location.href="./categoryPage.do?category="+category+"&&sub="+sub+"&&option="+option;
		}
	});
});
</script>
</head>
<body>
	<div id="wrapper">
		<c:import url="/header.do"/>
		<div id="container">
			<ul id="mainContainer">
				<li class="section">
					<div id="category" class="sector">
						<h2>#
							<c:choose>
								<c:when test="${mainCategory ne null }"><a href="./categoryPage.do?category=${mainCategory }" title="${mainCategory }">${mainCategory }</a></c:when>
								<c:otherwise><a href="./categoryPage.do" title="전체가구 보기" >가구</a></c:otherwise>
							</c:choose>
							<select name="optionSelect" class="sectorSelecter optionSelect">
								<option value="p_date">등록순</option>
								<option value="p_sell">구매순</option>
								<option value="p_priceUp">가격순(▲)</option>
								<option value="p_priceDown">가격순(▼)</option>
							</select>
						</h2>
						<div id="subCategory">
							<c:choose>
								<c:when test="${mainCategory ne null && subCategory ne null }">
									<c:forEach items="${category }" var="cg">
										<c:if test="${cg.c_main eq mainCategory }">
											<p <c:if test="${cg.c_sub eq subCategory }">style="border:1px solid black;"</c:if>>
												<a href="./categoryPage.do?category=${mainCategory }&&sub=${cg.c_sub }" title="${mainCategory } &gt; ${cg.c_sub}">#${cg.c_sub }</a>
											</p>
										</c:if>
									</c:forEach>
								</c:when>
								<c:when test="${mainCategory ne null && subCategory eq null }">
									<c:forEach items="${category }" var="cg">
										<c:if test="${cg.c_main eq mainCategory }">
											<p><a href="./categoryPage.do?category=${mainCategory }&&sub=${cg.c_sub }" title="${mainCategory } &gt; ${cg.c_sub}">#${cg.c_sub }</a></p>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach items="${categoryMain }" var="cm">
										<p><a href="./categoryPage.do?category=${cm.c_main }" title="${cm.c_main }">#${cm.c_main }</a></p>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div id="option" class="sector"></div>
					<div id="productList" class="sector">
						<div class="product">
							<c:forEach items="${cp_productList }" var="l">
								<figure class="scene">
									<img src="https://blogger.googleusercontent.com/img/a/${l.p_img }" alt="${l.p_title }" class="sceneImg"/>
									<figcaption class="detail">
										<p class="title">
											<span style="color:#999;font-size:12px;">[${l.c_main } > ${l.c_sub }]</span><br/>
											${l.p_title }
										</p>
										<p class="price"><fmt:formatNumber value="${l.p_price }" pattern="#,###"/>원<small <c:if test="${(l.p_cnt - l.p_sell) le 10 }">style="color:red;"</c:if>>(재고 ${l.p_cnt - l.p_sell }개)</small></p>
									</figcaption>
								</figure>
							</c:forEach>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<c:import url="./footer.jsp"/>
	</div>
</body>
</html>