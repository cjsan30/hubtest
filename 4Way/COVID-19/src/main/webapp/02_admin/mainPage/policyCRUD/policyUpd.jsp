<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String userId = (String)session.getAttribute("userId");
	
	if(userId == null){
		response.sendRedirect("/COVID-19/02_admin/admin_sign_in.jsp");
		return;
	}
	
	String p_id = request.getParameter("P_ID");
	String p_private = request.getParameter("P_PRIVATE");
	String p_enter = request.getParameter("P_ENTER");
	String p_rest = request.getParameter("P_REST");
	String p_link = request.getParameter("P_LINK");
	
	Connection con = null;
	CallableStatement csmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String userID = "covid19";
	String userPass = "1";

	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	con = DriverManager.getConnection(url,userID,userPass);
	
	String strProcName = "{call PKG_POLICYS.PROC_PO_UPD(?,?,?,?,?)}";
	csmt = con.prepareCall(strProcName);
	csmt.setString(1, p_id);
	csmt.setString(2, p_private);
	csmt.setString(3, p_enter);
	csmt.setString(4, p_rest);
	csmt.setString(5, p_link);
	csmt.execute();
	
	response.sendRedirect("../policyInfo.jsp");
	
%>