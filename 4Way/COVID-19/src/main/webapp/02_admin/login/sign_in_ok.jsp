<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.OracleTypes" %>
<%

	String strUserId = request.getParameter("identity");
	String strUserPW = request.getParameter("password");

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "covid19", "1");
		
		String strProcName = "{call PKG_LOGIN.PROC_LOGIN(?,?,?)}";
		
		CallableStatement csmt = con.prepareCall(strProcName);

		csmt.setString(1, strUserId);
		csmt.setString(2, strUserPW);
		csmt.registerOutParameter(3, OracleTypes.CURSOR);
		csmt.execute();
		
		ResultSet rs = (ResultSet)csmt.getObject(3);
		
		rs.next();
		
		String Login_YN = rs.getString("LOGIN_YN");
		String Email_YN = rs.getString("EMAIL_YN");
		
		if(Login_YN.equals("Y")){
			
			//로그인 - session
			session.setAttribute("userId", strUserId); // session 변수이름, 변수 값
			
			if(Email_YN.equals("Y")){
			
				response.sendRedirect("./Enter_your_Email.jsp?userId="+strUserId);	
			}else{
			
				response.sendRedirect("../mainP.jsp?userId="+strUserId);
			}
		}else{
			
			response.sendRedirect("../admin_sign_in.jsp?result=N");
		}
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
%>