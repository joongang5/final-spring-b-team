<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오페이 성공 페이지</title>
</head>
<body>
	카카오페이 결제가 정상적으로 완료되었습니다 ^^ <br>
	
	상품명 :${payInfo.item_name }<br>
	결제일시 :${payInfo.approved_at }<br>
	결제금액 :${payInfo.amount.total }<br>
	결제수단 :${payInfo.payment_method_type }<br>
	
	
</body>
</html>