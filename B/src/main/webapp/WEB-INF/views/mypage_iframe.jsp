<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 | Spring.B</title>
<link href="./resources/css/header.css" rel="stylesheet"/>
<link href="./resources/css/reset.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

window.addEventListener('DOMContentLoaded', (event) => {
	if(window.location.search.indexOf("init") > -1) {
		sessionStorage.removeItem("currentLocation");
		if(window.location.search.indexOf("myinfo.do") > -1) location.replace("mypage_iframe.do?to=myinfo.do");
		else if(window.location.search.indexOf("orderhistory1.do") > -1) location.replace("mypage_iframe.do?to=orderhistory1.do");
	}
	if(sessionStorage.getItem("currentLocation") != null) {
		document.getElementById("mypage").src = sessionStorage.getItem("currentLocation");
	} 
});

</script>
<style>
body {
	overflow: hidden;
}

#headerSpace {
	height: 124px;
}

#iframe-content {
	text-align: center;
 	margin: auto;
	margin-top: 1px;
    min-height: 813px;
    position: relative;
}

#iframe-content iframe {
	border: none;
    margin: 0;
    padding: 0;  
    width: 100%; 
    position: absolute; 
    top: 0; 
    left: 0; 
}

#footerSpace {
	height: 202px;
	position: absolute; 
}
</style>
</head>
<body>
<c:if test="${sessionScope.m_id eq null }">
	<c:redirect url="login.do" />
</c:if>
<div id="headerSpace"> 
<c:import url="/header.do"/>
</div>
<div id="iframe-content">
	<iframe src="<c:if test="${param.to != null}">${param.to}</c:if>" width="1920px" height="813px" id="mypage" title="마이페이지">
	    Error: 마이페이지를 정상적으로 불러오지 못했습니다.
	</iframe>
</div>
<footer id="footerSpace">
</footer>
</body>
</html>