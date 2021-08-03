<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.OracleTypes" %>
<%

	String strUserId = request.getParameter("userId");
	String strUserEmail = request.getParameter("email");

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "covid19", "1");
		
		String strProcName = "{call PKG_LOGIN.PROC_INS_EMAIL(?,?)}";
		
		CallableStatement csmt = con.prepareCall(strProcName);

		csmt.setString(1, strUserId);
		csmt.setString(2, strUserEmail);
		
		csmt.execute();
		
		response.sendRedirect("../mainP.jsp?userId="+strUserId);
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
%>