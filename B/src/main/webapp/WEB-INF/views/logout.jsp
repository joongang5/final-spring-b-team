<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
  function logout(){
	  sessionStorage.clear();
	  window.location.replace("index.do")
  }
</script>
<body>
    <input type="button" value="로그아웃" onclick="logout()">
</body>
</html>