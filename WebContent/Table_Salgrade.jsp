<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page import="skyfly33.board.dao.oracle.*"%>
<%@ page import="skyfly33.board.util.JdbcUtil"%>

<%
	Connection conn = JdbcUtil.getInstance().getConnection();
	try {
		request.setCharacterEncoding("UTF-8");

		OracleDao boardDao = new OracleDao();

		String sql = "select * from salgrade";

		ResultSet rs = boardDao.selectList(conn, sql);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
table,td,th {
	border: 1px solid yellow;
}

th {
	background-color: yellow;
	color: gray;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Donghoon's BoardSample - Salgrade_List</title>

</head>

<body>
	<h1>
		<p>Salgrade List</p>
	</h1>
	<table>

		<tr>
			<th>GRADE</th>
			<th>LOSAL</th>
			<th>HISAL</th>
		</tr>

		<%
			while (rs.next()) {

					out.print("<tr>");
					out.print("<td>" + rs.getString(1) + "</td>");
					out.print("<td>" + rs.getString(2) + "</td>");
					out.print("<td>" + rs.getString(3) + "</td>");
					out.print("</tr>");
				}
			} finally {
				JdbcUtil.close(conn);
			}
		%>

	</table>

	<p>
		<a href="Table_Board.jsp">Board</a><br /> <a href="Table_Emp.jsp">Emp
			List</a><br /> <a href="Table_Dept.jsp">Dept List</a>
	</p>
</body>
</html>