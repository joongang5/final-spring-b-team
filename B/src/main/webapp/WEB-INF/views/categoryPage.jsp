<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring.B 카테고리 페이지</title>
<link href="./resources/css/header.css" rel="stylesheet"/>
<link href="./resources/css/reset.css" rel="stylesheet"/>
<link href="./resources/css/footer.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
/* reset.css */
/* header.css */
/* footer.css */
/* container.css */	
#wrapper{width:100%;margin:0 auto;}
	#container{width:100%;padding-top:124px;}
		.mainContainer{width:100%;}
			.mainContainer .section{width:margin:0 auto;}

				.mainContainer .section .sector{width:1200px;margin:0 auto;}
					.mainContainer .section .sector h2{height:40px;line-height:40px;}
						.mainContainer .section .sector h2 .sectorSelecter{border:1px solid #ccc;outline:none;padding:9px;border-radius:15px;cursor:pointer;vertical-align:top;float:right;margin-left:15px;}
					.mainContainer .section .sector .product{width:150%;height:40%;clear:both;overflow:hidden;}
						.mainContainer .section .sector .product .scene{border-radius:5px;width:19%;height:100%;float:left;margin-right:1%;overflow:hidden;position:relative;cursor:pointer;}
							.mainContainer .section .sector .product .scene .sceneImg{display:block;width:100%;height:100%;}
							.mainContainer .section .sector .product .scene .detail{width:100%;height:100px;background-color:rgba(0,0,0,0.6);position:absolute;bottom:-100px;left:0;color:#fff;transition:0.3s all;}
						.mainContainer .section .sector .product .scene:hover .detail{bottom:0;}		
								.mainContainer .section .sector .product .scene .detail .title{padding:10px 0 0 10px;font-size:14px;max-height:65px;overflow:hidden;}
								.mainContainer .section .sector .product .scene .detail .price{padding:10px 5px 0 10px;font-size:12px;}
						
						.mainContainer .section .sector .product .sebu{position:relative;}
							.mainContainer .section .sector .product .scene img{position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);}
							
					
		.red{color:red;}
	#container:after{content:"";display:block;clear:both;}
</style>
<script>

</script>
</head>
<body>
	<div id="wrapper">
		<c:import url="/header.do"/>
		<div id="container">
			<ul class="mainContainer">
				<li class="section">
					<div id="category" class="sector">
						<h2>#${mainCategory }</h2>
						<div id="subCategory">
							
							<p>#subcategory</p>
						</div>
					</div>
					<div id="option" class="sector"></div>
					<div class="sector">
						<ul class="product">
							
								<c:if test="${pl.c_main eq cM.c_main}">
									<li class="scene">
										<img src="https://blogger.googleusercontent.com/img/a/${pl.p_img }" alt="${pl.p_title }" class="sceneImg"/>
										<div class="detail">
											<p class="title">
												<span style="color:#999;font-size:12px;">[${pl.c_main } > ${pl.c_sub }]</span><br/>
												${pl.p_title }
											</p>
											<p class="price">${pl.p_price }원<small <c:if test="${(pl.p_cnt - pl.p_sell) le 10 }">style="color:red;"</c:if>>(재고 ${pl.p_cnt - pl.p_sell }개)</small></p>
										</div>
									</li>									
								</c:if>
							
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<c:import url="./footer.jsp"/>
	</div>
</body>
</html>