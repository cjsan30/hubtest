<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.OracleTypes" %>
<%

	String strUserPW = request.getParameter("password");

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "covid19", "1");
		
		String strProcName = "{call PKG_LOGIN.PROC_CHK_PW(?,?)}";
		
		CallableStatement csmt = con.prepareCall(strProcName);

		csmt.setString(1, strUserPW);
		csmt.registerOutParameter(2, OracleTypes.CURSOR);
		
		csmt.execute();
		
		ResultSet rs = (ResultSet)csmt.getObject(2);
		
		rs.next();
		
		String PW_YN = rs.getString("PW_YN");
		
		response.sendRedirect("./myInfo.jsp?PW_YN=" + PW_YN);
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
%>