<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>


<%
	request.setCharacterEncoding("utf-8"); 

	String id = request.getParameter("id");
	String pass = request.getParameter("password");

	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pf?characterEncoding=utf8", "root", "1177mi");

		if(conn == null)
			throw new Exception("asdf");

		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from user where id='" + id + "';");

		if(!rs.next()) {
		%>
			<script>alert("아이디를 확인해주세요.");
			history.back();</script>
		<%
		} else {
			String password = rs.getString("password");
			if(pass.equals(password)) {
			session.setAttribute("id",id);
			session.setAttribute("pw",pass);

			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
			} else {
				%>
				<script>alert("비밀번호를 확인해주세요.");
				history.back();</script>
				<%
			}
		}
	} finally {
		try {
			stmt.close();
		} catch(Exception e) {
		} try {
			conn.close();
		} catch(Exception e) {
		}
	}
%>