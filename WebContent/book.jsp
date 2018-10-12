<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
bgcolor
:blue
;
</style>
<body>

	<%@page import="java.sql.*"%>
	<%
		String id = request.getParameter("root");
		String driver = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String database = "Book";
		String userid = "root";
		String password = "password";
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
	%>

	<%
		int i = Integer.parseInt(request.getParameter("price"));
	%>


	<h1>Retrieve data from database in jsp</h1>
	<table border="1">
		<tr>
			<td>BOOK_ID</td>
			<td>BOOK_NAME</td>
			<td>BOOK_AUTHOR</td>
			<td>BOOK_PRICE</td>

		</tr>

		<%
			try {
				connection = DriverManager.getConnection(connectionUrl
						+ database, userid, password);
				statement = connection.createStatement();
				String sql = "select * from BookStore where BOOK_PRICE >" + i;
				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
		%>
		<tr>
			<td><%=resultSet.getString("BOOK_ID")%></td>
			<td><%=resultSet.getString("BOOK_NAME")%></td>
			<td><%=resultSet.getString("BOOK_AUTHOR")%></td>
			<td><%=resultSet.getString("BOOK_PRICE")%></td>
		</tr>
		<%
			}
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
</body>
</html>