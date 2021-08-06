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
	
	String p_level = request.getParameter("P_LEVEL");
	String p_sdate = request.getParameter("P_SDATE");
	String p_edate = request.getParameter("P_EDATE");
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
	
	String strProcName = "{call PKG_POLICYS.PROC_PO_INS(?,?,?,?,?,?,?,?)}";
	csmt = con.prepareCall(strProcName);
	csmt.setString(1, p_level);
	csmt.setString(2, p_sdate);
	csmt.setString(3, p_edate);
	csmt.setString(4, p_private);
	csmt.setString(5, p_enter);
	csmt.setString(6, p_rest);
	csmt.setString(7, userId);
	csmt.setString(8, p_link);
	csmt.execute();

	response.sendRedirect("../policyInfo.jsp");

%>