<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Donghoon's BoardSample - Board_Login</title>
<script>
	function formCheck() {
		var id = document.forms[0].id;
		var pass = document.forms[0].pass;

		if (id.value == null || id.value == "") {
			alert('아이디를 입력하세요');
			document.forms[0].id.focus();
			return false;
		}

		if (pass.value == null || pass.value == "") {
			alert('비밀번호를 입력하세요');
			document.forms[0].pass.focus();
			return false;
		}

	}
	function logCheck(check) {
		if (check == 1) {
			alert('존재하지 않는 아이디 입니다.');
			return false;
		}
		if (check == 2) {
			alert('비밀번호가 틀렸습니다.');
			return false;
		}
	}
	function logout() {
		alert("이용해주셔서 감사합니다.");
	}
</script>
</head>
<body>
	<c:if test="${check == 1 || check == 2}">
		<script language="javascript">
			logCheck("${check}");
		</script>
	</c:if>
	<c:choose>
		<c:when test="${check == 0 }">
			<form action="/michiget/logout" method="get"
				onsubmit="return logout();">
				<table>

					<tr>${nick }님환영합니다.
					</tr>

					<input type="submit" value="로그아웃" />
					
				</table>
			</form>
		</c:when>
		<c:otherwise>
			<form action="login" method="POST"
				onsubmit="return formCheck();">
				<table>

					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" size="20" /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pass" size="20" /></td>
					</tr>

				</table>
				<input type="submit" value="로그인" /><br>

			</form>
		</c:otherwise>
	</c:choose>
	<a href="Form_Join.jsp">회원가입</a>
	<a href="Table_Member.jsp">회원리스트</a>
</body>
</html>
