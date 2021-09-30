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
	header{width:100%;height:120px;position:fixed;top:0;left:0;z-index:99;}
		.header{margin:0 auto;}
		#nameLine{width:1080px;text-align:right;height:30px;line-height:30px;}
		#logoLine{width:1080px;height:55px;line-height:50px;}
			#logoLine h1{width:100px;height:100%;float:left;}
			#logoLine .center{width:880px;text-align:center;float:left;}
				#logoLine .center input{padding:8px 10px;width:400px;vertical-align:top;margin-top:5px;border-radius:15px;border:1px solid gray;}
				#logoLine .center input:focus{outline:none;}
			#logoLine .right{width:100px;float:left;}
		#logoLine:after{content:"";display:block;clear:both;}
		nav{width:100%;height:36px;line-height:35px;border-top:1px solid #eee;border-bottom:1px solid #eee;position:relative;}
			nav #parent{width:1080px;margin:0 auto;}
				nav #parent li{width:120px;float:left;text-align:center;line-height:35px;height:35px;}
					nav #parent li a{display:block;width:80px;height:25px;line-height:25px;border-radius:10px;margin:5px auto 0;}
					.navMain:hover, .navMain:focus{background-color:#5AC5F0;color:#fff;}
					nav #parent li a:hover, nav #parent li a:focus{background-color:#5AC5F0;color:#fff;}
					nav #parent li .son{width:120px;position:absolute;}
						nav #parent li .son li{width:120px;border-top:1px solid #ccc;background-color:white;}
			nav:after{content:""; display:block; clear:both;}
	
	#container{widht:100%;}
		.mainContainer{width:100%;}
			.mainContainer li.section{width:100%;height:100vh;background-color:#ccc;margin:0 auto;}
			.mainContainer li.section:nth-child(even){background-color:#ddd;}
			/*광고영역*/
				.mainContainer li.section #ad{width:100%;height:100%;position:relative;overflow:hidden;}
					#ad #screen{width:400%;height:100%;}
						#ad #screen .scene{float:left; width:25%;height:100%;background-color:#D6DBDF;text-align:center;line-height:979px;}
						#ad #screen .scene:nth-child(even){background-color:#D1F2EB;}
					#ad #screen:after{ content:""; display:block; clear:both;}
			
					#ad #btn{ width:160px; height:50px; position:absolute; left:50%; margin-left:-80px; bottom:100px;}
						#ad #btn .nextPrev{width:80px;height:20px;margin:0 auto 10px;}
							#ad #btn .nextPrev span{display:inline-block;width:20px;margin-left:20px;height:20px;line-height:20px;text-align:center;background-color:#fff;cursor:pointer;}
						/* #ad #btn ul{ width:100%;}
							#ad #btn ul li{ width:20px; height:20px; border-radius:10px; background-color:#ccc; float:left; margin-left:20px; cursor:pointer;transition:0.3s all;}
							#ad #btn ul span{display:none;}
						#ad #btn ul:after{ content:""; display:block; clear:both;}
			
						######## 이벤트 클래스 #########
						#ad #btn li.addBtn{background-color:#f00;border-radius:0px;} */
				
				
				.mainContainer li.section .sector{width:1080px;height:80%;padding:10% 0;margin:0 auto;overflow:hidden;}
					.mainContainer li.section .sector h2{padding:50px 0 100px;}
					.mainContainer li.section .sector .product{width:150%;height:40%;}
						.mainContainer li.section .sector .product .scene{background-color:gray;border-radius:5px;width:19%;height:100%;float:left;margin-right:1%;overflow:hidden;position:relative;cursor:pointer;}
							.mainContainer li.section .sector .product .scene .detail{width:100%;height:100px;background-color:rgba(0,0,0,0.3);position:absolute;bottom:-100px;left:0;color:#fff;transition:0.3s all;}
						.mainContainer li.section .sector .product .scene:hover .detail{bottom:0;}
								.mainContainer li.section .sector .product .scene .detail .title{padding:10px;font-size:14px;}
								.mainContainer li.section .sector .product .scene .detail .price{padding:10px;font-size:12px;}
							
			
	#container:after{content:"";display:block;clear:both;}
</style>
<script>
window.addEventListener("wheel", function(e){
	e.preventDefault();
},{passive : false});
$(function(){
	//헤더 네비게이션
	$(".son").hide();
	$("#parent li").on("mouseover focusin",function(){
		$(this).children(".son").stop().show(500);
	}).on("mouseout focusout",function(){
		$(this).children(".son").stop().hide(500);
	});
	
	//one페이징
	var $html = $("html");
	var page = 1;
	var lastPage = $(".section").length;
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
		var posTop = (page-1) * $(window).height();
		$html.animate({scrollTop : posTop});
	});
	
	//광고 슬라이딩
	/* $("#btn ul li:eq(0)").addClass("addBtn");
	$("#btn ul li").click(function(){
		var btnIndex = $(this).index();
		$("#btn ul li").removeClass();
		$("#btn ul li:eq("+btnIndex+")").addClass("addBtn");
		width = $(".scene").width();
		for(var i=0; i<width; i++){
			if( btnIndex == i ){
				$("#screen").animate({"marginLeft":"-"+width*btnIndex+"px"},500);
			}
		}
	}); */
	$("#screen").append( $("#screen .scene:last") );
	$("#screen").css({"marginLeft":"-100%"});

	$(".next").click(function(){
		$("#screen:not(:animated)").stop().animate({"marginLeft":"-=100%"},1000,"swing",function(){
			$("#screen").append( $("#screen .scene:first") );
			$("#screen").css({"marginLeft":"-100%"});
		});
	});
	
	$(".prev").click(function(){
		$("#screen:not(:animated)").stop().animate({"marginLeft":"+=100%"},1000,"swing",function(){
			$("#screen").prepend( $("#screen .scene:last") );
			$("#screen").css({"marginLeft":"-100%"});
		});
	});
	var autoSel = setInterval(function(){  
		$(".next").click();
	}, 5000);
});

</script>
</head>
<body>
	<div id="wrapper">
		<header>
			<div id="nameLine" class="header">
				<c:if test="${sessionScope.m_id eq null}">
					<a href="" title="로그인">로그인해주세요.</a>				
				</c:if>
				<c:if test="${sessionScope.m_id ne null}">			
					<a href="" title="로그아웃">??님, 안녕하세요.</a><br>
					<a href="" title="마이페이지">마이페이지</a>			
				</c:if>
			</div>
			<div id="logoLine" class="header">
				<h1>로고</h1>
				<p class="center"><input type="text" placeholder="검색"></p>
				<p class="right"></p>
			</div>
			<nav class="header">
				<ul id="parent">
					<li>
						<a href="" title="거실" class="navMain">거실</a>
						<ul class="son">
							<li><a href="" title="소파">소파</a></li>
							<li><a href="" title="테이블">테이블</a></li>
						</ul>
					</li>
					<li>
						<a href="" title="주방" class="navMain">주방</a>
						<ul class="son">
							<li><a href="" title="식탁">식탁</a></li>
							<li><a href="" title="의자">의자</a></li>
						</ul>
					</li>
					<li>
						<a href="" title="침실" class="navMain">침실</a>
						<ul class="son">
							<li><a href="" title="침대">침대</a></li>
							<li><a href="" title="서랍장">서랍장</a></li>
						</ul>
					</li>
					<li>
						<a href="" title="서재" class="navMain">서재</a>
						<ul class="son">
							<li><a href="" title="책장">책장</a></li>
							<li><a href="" title="책상">책상</a></li>
							<li><a href="" title="의자">의자</a></li>
						</ul>
					</li>
					<li>
						<a href="" title="잡화" class="navMain">잡화</a>
						<ul class="son">
							<li><a href="" title="조명">조명</a></li>
							<li><a href="" title="장식">장식</a></li>
							<li><a href="" title="수납">수납</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</header>
		<div id="container">
			<ul class="mainContainer">
				<li class="section">
					<div id="ad">
						<ul id="screen">
							<li class="scene">
								광고1
							</li>
							<li class="scene">
								광고2
							</li>
							<li class="scene">
								광고3
							</li>
							<li class="scene">
								광고4
							</li>
						</ul>
						<div id="btn">
							<p class="nextPrev"><span class="prev">&lt;</span><span class="next">&gt;</span></p>
							<!-- <ul>
								<li><a href="#btn0" title="btn0"><span>0</span></a></li>
								<li><a href="#btn1" title="btn1"><span>1</span></a></li>
								<li><a href="#btn2" title="btn2"><span>2</span></a></li>
								<li><a href="#btn3" title="btn3"><span>3</span></a></li>
							</ul> -->
						</div>
					</div>
				</li>
				<li class="section">
					<div class="sector">
						<h2><a href="" title="거실">#거실</a></h2>
						<ul class="product">
							<li class="scene">
								제품1
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품2
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품3
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품4
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품5
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
						</ul>
						<p class="nextBtn">
							next
						</p>
					</div>
				</li>
				<li class="section">
					<div class="sector">
						<h2><a href="" title="주방">#주방</a></h2>
						<ul class="product">
							<li class="scene">
								제품1
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품2
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품3
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품4
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품5
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
						</ul>
					</div>
				</li>
				<li class="section">
					<div class="sector">
						<h2><a href="" title="침실">#침실</a></h2>
						<ul class="product">
							<li class="scene">
								제품1
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품2
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품3
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품4
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품5
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
						</ul>
					</div>
				</li>
				<li class="section">
					<div class="sector">
						<h2><a href="" title="서재">#서재</a></h2>
						<ul class="product">
							<li class="scene">
								제품1
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품2
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품3
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품4
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품5
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
						</ul>
					</div>
				</li>
				<li class="section">
					<div class="sector">
						<h2><a href="" title="참화">#잡화</a></h2>
						<ul class="product">
							<li class="scene">
								제품1
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품2
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품3
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품4
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
							<li class="scene">
								제품5
								<div class="detail">
									<p class="title">제목</p>
									<p class="price">가격</p>
								</div>
							</li>
						</ul>
					</div>
				</li>
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