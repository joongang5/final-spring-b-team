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
	header{width:100%;height:120px;position:fixed;top:0;left:0;}
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
				nav #parent li{width:120px;float:left;text-align:center;line-height:35px;}
					nav #parent li a.navMain{display:block;width:80px;height:25px;line-height:25px;border-radius:10px;margin:5px auto 0;}
					.navMain:hover, .navMain:focus{background-color:#5AC5F0;color:#fff;}
					nav #parent li .son{width:120px;position:absolute;}
						nav #parent li .son li{width:120px;border-top:1px solid #ccc;background-color:white;}
			nav:after{content:""; display:block; clear:both;}
	
	#container{widht:100%;}
		.mainContainer{width:100%;}
			.mainContainer li.section{width:100%;height:100vh;background-color:pink;margin:0 auto;}
			.mainContainer li.section:nth-child(even){background-color:#ccc;}
	#container:after{content:"";display:block;clear:both;}
</style>
<script>
window.addEventListener("wheel", function(e){
	e.preventDefault();
},{passive : false});
$(function(){
	$(".son").hide();
	$("#parent li a").mouseover(function(){
		$(this).siblings(".son").stop().show(500);
	}).mouseout(function(){
		$(this).siblings(".son").stop().hide(500);
	});
	var $html = $("html");
	 
	var page = 1;
	 
	var lastPage = $(".content").length;
	 
	$html.animate({scrollTop:0},10);
	$(window).on("wheel", function(e){
		 
		if($html.is(":animated")) return;
	 
		if(e.originalEvent.deltaY > 0){
			if(page== lastPage) return;
	 
			page++;
		}else if(e.originalEvent.deltaY < 0){
			if(page == 1) return;
	 
			page--;
		}
		var posTop = (page-1) * $(window).height();
	 
		$html.animate({scrollTop : posTop});
	});
	$("#container").append($("footer"));
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
					<ul id="ad">
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
				</li>
				<li class="section">
					<h2><a href="" title="거실">#거실</a></h2>
					<ul class="product">
						<li class="scene">
							제품1
						</li>
						<li class="scene">
							제품2
						</li>
						<li class="scene">
							제품3
						</li>
						<li class="scene">
							제품4
						</li>
						<li class="scene">
							제품5
						</li>
					</ul>
				</li>
				<li class="section">
					<h2><a href="" title="주방">#주방</a></h2>
					<ul class="product">
						<li class="scene">
							제품1
						</li>
						<li class="scene">
							제품2
						</li>
						<li class="scene">
							제품3
						</li>
						<li class="scene">
							제품4
						</li>
						<li class="scene">
							제품5
						</li>
					</ul>
				</li>
				<li class="section">
					<h2><a href="" title="침실">#침실</a></h2>
					<ul class="product">
						<li class="scene">
							제품1
						</li>
						<li class="scene">
							제품2
						</li>
						<li class="scene">
							제품3
						</li>
						<li class="scene">
							제품4
						</li>
						<li class="scene">
							제품5
						</li>
					</ul>
				</li>
				<li class="section">
					<h2><a href="" title="서재">#서재</a></h2>
					<ul class="product">
						<li class="scene">
							제품1
						</li>
						<li class="scene">
							제품2
						</li>
						<li class="scene">
							제품3
						</li>
						<li class="scene">
							제품4
						</li>
						<li class="scene">
							제품5
						</li>
					</ul>
				</li>
				<li class="section">
					<h2><a href="" title="참화">#잡화</a></h2>
					<ul class="product">
						<li class="scene">
							제품1
						</li>
						<li class="scene">
							제품2
						</li>
						<li class="scene">
							제품3
						</li>
						<li class="scene">
							제품4
						</li>
						<li class="scene">
							제품5
						</li>
					</ul>
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