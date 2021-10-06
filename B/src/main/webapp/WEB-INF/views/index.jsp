<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
*{padding:0;margin:0;list-style:none;}
a{color:black;text-decoration:none;transition:0.3s all;}
a:link, a:visited{color:black;}
a:hover, a:focus{text-decoration:underline;}
::-webkit-scrollbar {
	width: 0px;
}
html{overflow: hidden;}
html, body{width: 100%; height: 100%;}
#wrapper{width:100%;margin:0 auto;}
	header{width:100%;height:122px;position:fixed;top:0;left:0;z-index:99;}
		.header{margin:0 auto;}
		#nameLine2{width:100%;height:20px;background-color:#F2E3D5;border-bottom:1px solid #000;}
			#nameLine{width:1200px;text-align:right;height:20px;line-height:20px;font-size:13px;}
		#logoLine{width:1200px;height:65px;line-height:65px;}
			#logoLine h1{width:100px;height:100%;float:left;color:#FFA335;}
			#logoLine .center{width:1000px;text-align:center;float:left;}
				#logoLine .center input{padding:8px 10px;width:400px;vertical-align:top;margin-top:15px;border-radius:15px;border:1px solid gray;}
				#logoLine .center input:focus{outline:none;}
			#logoLine .right{width:100px;float:left;}
		#logoLine:after{content:"";display:block;clear:both;}
		nav{width:100%;height:36px;line-height:35px;border-top:1px solid #ccc;border-bottom:1px solid #ccc;position:relative;}
			nav #parent{width:1200px;margin:0 auto;}
				nav #parent li{width:120px;float:left;text-align:center;line-height:35px;height:35px;}
					nav #parent li a{display:block;width:80px;height:25px;line-height:25px;border-radius:10px;margin:5px auto 0;font-size:15px;}
					nav #parent li a.navMain{width:90%;font-size:16.5px;font-weight:400;}
					
					nav #parent li a:hover, nav #parent li a:focus{background-color:#FFA335;color:#fff;}
					.navMain:hover a.navMain{background-color:#FFA335;color:#fff;}
					nav #parent li .son{width:120px;position:absolute;padding-top:6px;}
						nav #parent li .son li{width:120px;border-top:1px solid #ccc;background-color:white;}
						nav #parent li .son li:last-child{border-bottom:1px solid #ccc;}
			nav:after{content:""; display:block; clear:both;}
	
	#container{widht:100%;}
		.mainContainer{width:100%;}
			.mainContainer li.section{width:100%;height:100vh;margin:0 auto;}
			/*광고영역*/
				.mainContainer li.section #ad{width:100%;height:100%;position:relative;overflow:hidden;}
					#ad #screen{width:400%;height:100%;}
						#ad #screen .scene{float:left; width:25%;height:100%;background-color:#D6DBDF;overflow:hidden;}
							#ad #screen .scene img{display:block;width:100%;height:100%;}
					#ad #screen:after{ content:""; display:block; clear:both;}
			
					#ad #btn{ width:160px; height:50px; position:absolute; left:50%; margin-left:-80px; bottom:100px;}
						#ad #btn .nextPrev{width:100%;margin:0 auto 10px;}
							#ad #btn .nextPrev span{display:inline-block;margin-left:20px;cursor:pointer;font-size:40px;color:#fff;}
							#ad #btn .nextPrev span.prev{float:left;}
							#ad #btn .nextPrev span.next{float:right;}
						#ad #btn ul{ width:100%;clear:both;}
							#ad #btn ul li{ width:20px; height:20px; border-radius:10px; background-color:#ccc; float:left; margin-left:20px;}
							#ad #btn ul span{display:none;}
						#ad #btn ul:after{ content:""; display:block; clear:both;}
			
						/*######## 이벤트 클래스 #########*/
						#ad #btn li.addBtn{background-color:#FFA335;}
				
				
				.mainContainer li.section .sector{width:1200px;height:80%;padding:10% 0;margin:0 auto;overflow:hidden;}
					.mainContainer li.section .sector h2{padding:50px 0 100px;height:40px;line-height:40px;}
						.mainContainer li.section .sector h2 .sectorSelecter{border:1px solid #ccc;outline:none;padding:9px;border-radius:15px;cursor:pointer;vertical-align:top;float:right;margin-left:15px;}
					.mainContainer li.section .sector .product{width:150%;height:40%;clear:both;overflow:hidden;}
						.mainContainer li.section .sector .product .scene{border-radius:5px;width:19%;height:100%;float:left;margin-right:1%;overflow:hidden;position:relative;cursor:pointer;}
							.mainContainer li.section .sector .product .scene .sceneImg{display:block;width:100%;height:100%;}
							.mainContainer li.section .sector .product .scene .detail{width:100%;height:100px;background-color:rgba(0,0,0,0.6);position:absolute;bottom:-100px;left:0;color:#fff;transition:0.3s all;}
						.mainContainer li.section .sector .product .scene:hover .detail{bottom:0;}
								.mainContainer li.section .sector .product .scene .detail .title{padding:10px 0 0 10px;font-size:14px;max-height:65px;overflow:hidden;}
								.mainContainer li.section .sector .product .scene .detail .price{padding:10px 5px 0 10px;font-size:12px;}
						
						.mainContainer li.section .sector .product .sebu{position:relative;}
							.mainContainer li.section .sector .product .scene img{position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);}
							
					.mainContainer li.section .sector .nextBtn{max-width:60px;float:right;text-align:right;cursor:pointer;}
						.mainContainer li.section .sector .nextBtn span{transition:0.5s all;}
						.mainContainer li.section .sector .nextBtn .cross{display:inline-block;width:0px;}
						.mainContainer li.section .sector .nextBtn:hover .cross{width:16px;}
					.mainContainer li.section .sector .nextBtn:after{content:"";display:block;clear:both;}
							
			
	#container:after{content:"";display:block;clear:both;}
</style>
<script>
//one페이징을 위한 휠기능 막기
window.addEventListener("wheel", function(e){
	e.preventDefault();
},{passive : false});
$(function(){
	//헤더 네비게이션
	$(".son").hide();
	$("#parent li").on("mouseover focusin",function(){
		$(this).children(".son").stop().show();
	}).on("mouseout focusout",function(){
		$(this).children(".son").stop().hide();
	});
	
	//one페이징
	var $html = $("html");
	var page = 1;
	var lastPage = $(".section").length;
	//$(window).scrollTop(0);
	$html.animate({scrollTop:0},10);
	$(window).on("wheel", function(e){
		if($html.is(":animated")) return;
		if(e.originalEvent.deltaY > 0){
			if(page == lastPage+1) return;
			page++;
		}else if(e.originalEvent.deltaY < 0){
			if(page == 1) return;
			page--;
		}
		if(page != 1){
			$("header").css({"backgroundColor":"rgba(255,255,255,1)"});
		}
		if(page == 1){
			$("header").css({"backgroundColor":"rgba(255,255,255,0)"});
		}
		var posTop = (page-1) * $(window).height();
		$html.animate({scrollTop : posTop});
	});
	
	//광고 슬라이딩
	$("#screen").prepend( $("#screen li:last") );
	$("#screen").css({"marginLeft":"-100%"});
	$("#btn ul li:first").addClass("addBtn");
	var autoSel = setInterval(function(){  
		$(".next").click();
	}, 5000);
	$(".next").click(function(){
		clearInterval( autoSel );
		$("#screen:not(:animated)").stop().animate({"marginLeft":"-=100%"},1000,"swing",function(){
			$("#screen").append( $("#screen li:first") );
			$("#screen").css({"marginLeft":"-100%"});
		});
		$("#btn ul").prepend($("#btn ul li:last"));
		autoSel = setInterval(function(){  
			$(".next").click();
		}, 5000);
	});
	$(".prev").click(function(){
		clearInterval( autoSel );
		$("#screen:not(:animated)").stop().animate({"marginLeft":"+=100%"},1000,"swing",function(){
			$("#screen").prepend( $("#screen li:last") );
			$("#screen").css({"marginLeft":"-100%"});
		});
		$("#btn ul").append($("#btn ul li:first"));
		autoSel = setInterval(function(){  
			$(".next").click();
		}, 5000);
	});
	
	
	//카테고리별 슬라이딩
	$(".product").css({"marginLeft":"-30%"});
	$(".nextBtn").click(function(){
		$(this).prev(".product:not(:animated)").stop().animate({"marginLeft":"-=30%"},1000,"swing",function(){
			$(this).append( $(this).children("li:first") );
			$(this).css({"marginLeft":"-30%"});
		});
	});
	
	//카테고리 옵션
	$(".sectorSelecter").change(function(){
		var selectName = $(this).attr("name");
		var option = $(this).val();
		var selectName2 = "";
		var option2 = "";
		var category = $(this).siblings("input[name=category]").val();
		if(selectName == "optionSelect"){
			selectName2 = $(this).siblings(".listSelect").attr("name");
			option2 = $(this).siblings(".listSelect").val();
		}else{
			selectName2 = $(this).siblings(".optionSelect").attr("name");
			option2 = $(this).siblings(".optionSelect").val();
		}
		
		$(this).parent().siblings(".product").empty();
		var html = '<li class="scene sebu"><img alt="세부페이지로 이동" src="./resources/images/move.png" title="' + category + '로 이동하기"></li>';
		$.ajax({
			url:"${pageContext.request.contextPath}/productList.do?"+selectName+"="+option+"&&"+selectName2+"="+option2+"&&category="+category,
			type:"POST",
			success:function(data){
				var list = data.list;
				console.log(data);
				console.log(list);
				$.each(list, function(index, value){
					html += '<li class="scene"><img src="https://blogger.googleusercontent.com/img/a/'+list[index].p_img+'" alt="'+list[index].p_title+'" class="sceneImg"/><div class="detail"><p class="title"><span style="color:#999;font-size:12px;">['+list[index].c_main+' > '+list[index].c_sub+']</span><br/>'+list[index].p_title+'</p><p class="price">'+list[index].p_price+'원</p></div></li>';
					console.log(index);
					console.log(value);
				});
				console.log(html);
			}, error : function(request, status, error){
				alert("error : " + error);
			}
		});
		$(this).parent().siblings(".product").html(html);
	});
});

</script>
</head>
<body>
	<div id="wrapper">
		<header>
			<div id="nameLine2" class="header">
				<div id="nameLine" class="header">
					<c:if test="${sessionScope.m_id eq null}">
						<a href="" title="로그인">로그인해주세요.</a>				
					</c:if>
					<c:if test="${sessionScope.m_id ne null}">			
						<a href="" title="로그아웃">??님, 안녕하세요.</a><br>
						<a href="" title="마이페이지">마이페이지</a>			
					</c:if>
				</div>
			</div>
			<div id="logoLine" class="header">
				<h1>로고</h1>
				<p class="center"><input type="text" placeholder="검색"></p>
				<p class="right"></p>
			</div>
			<nav class="header">
				<ul id="parent">
					<c:forEach items="${categoryMain }" var="cm">					
						<li class="navMain">
							<a href="" title="${cm.c_main }" class="navMain">${cm.c_main }</a>
							<ul class="son">
								<c:forEach items="${category }" var="c">
									<c:if test="${cm.c_main eq c.c_main}">
										<li class="navSon"><a href="" title="${cm.c_main } &gt; ${c.c_sub}" class="navSon">${c.c_sub}</a></li>
									</c:if>
								</c:forEach>
							</ul>
						</li>
					</c:forEach>
				</ul>
			</nav>
		</header>
		<div id="container">
			<ul class="mainContainer">
				<li class="section">
					<div id="ad">
						<ul id="screen">
							<li class="scene">
								<img alt="광고영" src="./resources/images/ad0.jpg">
							</li>
							<li class="scene">
								<img alt="광고일" src="./resources/images/ad1.jpg">
							</li>
							<li class="scene">
								<img alt="광고이" src="./resources/images/ad2.jpg">
							</li>
							<li class="scene">
								<img alt="광고삼" src="./resources/images/ad3.jpg">
							</li>
						</ul>
						<div id="btn">
							<p class="nextPrev"><span class="prev">&lt;</span><span class="next">&gt;</span></p>
							<ul>
								<li><a href="#btn0" title="btn0"><span>0</span></a></li>
								<li><a href="#btn1" title="btn1"><span>1</span></a></li>
								<li><a href="#btn2" title="btn2"><span>2</span></a></li>
								<li><a href="#btn3" title="btn3"><span>3</span></a></li>
							</ul>
						</div>
					</div>
				</li>
				<c:forEach items="${categoryMain}" var="cM">
					<li class="section">
						<div class="sector">
							<h2>
								<a href="" title="${cM.c_main }">#${cM.c_main }</a>
								<select name="optionSelect" class="sectorSelecter optionSelect">
									<option value="p_date" selected>등록순</option>
									<option value="p_sell">구매순</option>
									<option value="p_priceUp">가격순(▲)</option>
									<option value="p_priceDown">가격순(▼)</option>
								</select>
								<select name="listSelect" class="sectorSelecter listSelect">
									<option value="5" selected>5개</option>
									<option value="10">10개</option>
								</select>
								<input name="category" type="hidden" value="${cM.c_main }"/>
							</h2>
							<ul class="product">
								<li class="scene sebu">
									<img alt="세부페이지로 이동" src="./resources/images/move.png" title="${cM.c_main }로 이동하기">
								</li>
								<c:forEach items="${productList }" var="pl">
									<c:if test="${pl.c_main eq cM.c_main}">
										<li class="scene">
											<img src="https://blogger.googleusercontent.com/img/a/${pl.p_img }" alt="${pl.p_title }" class="sceneImg"/>
											<div class="detail">
												<p class="title"><span style="color:#999;font-size:12px;">[${pl.c_main } > ${pl.c_sub }]</span><br/>${pl.p_title }</p>
												<p class="price">${pl.p_price }원</p>
											</div>
										</li>									
									</c:if>
								</c:forEach>
							</ul>
							<p class="nextBtn">
								next<span class="cross">→</span>
							</p>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<footer>
			<div>사이트맵</div>
			<div>법률</div>
			<div>SNS</div>
			<div>카피라이트
				&copy; 2021 Spring.B
			</div>
		</footer>
	</div>
</body>
</html>