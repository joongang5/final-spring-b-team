<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myinfo</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function myAccountDelete(no) {
		if (confirm("정말 탈퇴하시겠습니까?")) {
			alert("계정 탈퇴 되었습니다.");
			location.href = "./myAccountDelete.do";
		} else {
			alert("취소되었습니다.");
			location.href = "./myinfo.do";
		}
	}

	function move() {
		location.href = './main.do';
	}

	function changePhone() {
		var phoneTd = $('#phoneTd');
		var phoneSpan = phoneTd.children().first();
		var temp = phoneSpan.text();

		phoneSpan.remove();

		var phoneInput = "<input type='text' name='m_phone' value='" + temp + "'>";
		phoneTd.append(phoneInput);
	}

	function onClickButton(id) {
		var parentTd = $('#' + id + 'Td');
		var element = parentTd.children().first();

		var tempTag = element.prop('tagName');
		var tempValue;
		if (tempTag == 'INPUT') {
			tempValue = element.val();
		} else if (tempTag == 'SPAN') {
			tempValue = element.text();
		}

		element.remove();

		var html;
		if (tempTag == 'INPUT') {
			html = "<span>" + tempValue + "</span>"
		} else if (tempTag == 'SPAN') {
			html = "<input type='text' name='m_" + id + "' value='" + tempValue + "'>";
		}
		parentTd.append(html);
	}
</script>
</head>
<body>
	<h1>회원정보조회</h1>
	<a href="./myinfo.do">회원정보조회</a>
	<a href="./myinfoUpdatePW.do">비밀번호수정</a>
	<a href="./myinfoDelete.do">회원탈퇴</a>
	<a href="./cart.do">장바구니</a>
	<a href="./logout.do">로그아웃</a>
	<hr>
	<form action="./myinfoUpdate.do" method="post">
		<table border="0" width="300px">
			<tr>
				<th>아이디</th>
				<td><span>${myinfo.m_id }</span></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><span>${myinfo.m_name }</span></td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td><input type="text" name="m_phone"
					value="${myinfo.m_phone }"></td>
				<td>
					<button>변경</button>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="m_email"
					value="${myinfo.m_email}"></td>
				<td><button>변경</button></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="m_addr" value="${myinfo.m_addr }"></td>
				<td><button>변경</button></td>
			</tr>
			<tr>
				<!-- <td colspan=2 align=center><input type="submit" value="정보수정">&emsp;
					<input type="reset" value="초기화"></td> -->
			</tr>
		</table>
	</form>
	<%-- <button onclick="myAccountDelete('${myinfo.m_id }')">회원탈퇴</button>
	<button onclick="location.href='./main.do'">게시판으로</button> --%>
</body>
</html>