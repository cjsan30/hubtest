<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.OracleTypes" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%//@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.io.FileUtils" %>
<%

	String strUserId = request.getParameter("identity");
	String strUserEmail = request.getParameter("email");

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "covid19", "1");
		
		String strProcName = "{call PKG_LOGIN.PROC_FIND_PW(?,?,?)}";
		
		CallableStatement csmt = con.prepareCall(strProcName);

		csmt.setString(1, strUserId);
		csmt.setString(2, strUserEmail);
		csmt.registerOutParameter(3, OracleTypes.CURSOR);
		csmt.execute();
		
		ResultSet rs = (ResultSet)csmt.getObject(3);
		
		rs.next();
		
		String YN = rs.getString("YN");
		String newPW = rs.getString("NEWPW");
		
		if(YN.equals("Y")){
			
			// ===================== 새 비밀번호 전송 ==========================
			String host = "smtp.naver.com";
			/*
			try {
			    File file = new File("/home/mjs/test/text.txt");
			    List<String> lines = FileUtils.readLines(file, "UTF-8");
			    for(String line : lines) {
			        System.out.println(line);
			    }
			} catch (IOException e) {
			    e.printStackTrace();
			}
			*/
			final String user = "smart_98"; //발신자의 이메일 아이디를 입력
			final String password = ""; //발신자 이메일의 패스워드를 입력
			// 자바 jsp 설정파일 읽어오기
			String from = "smart_98@naver.com";
			String fromName = "사거리";

			String body = String.join(
					
					System.getProperty("line.separator"),
					"<div style='width:300px; border:1px solid #aaa;'>",
						"<h1 style='text-align:center;'>새 비밀번호</h1>",
				        "<p style='text-align:center;'>" + newPW + "</p>.",
			        "</div>"
					);
			
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", host); 
			props.put("mail.smtp.port", 587); 
			props.put("mail.smtp.auth", "true");

			Session emailSession = Session.getInstance(props, new javax.mail.Authenticator() { 
							protected PasswordAuthentication getPasswordAuthentication() { 
								return new PasswordAuthentication(user, password); } 
							});

			try { 
				MimeMessage message = new MimeMessage(emailSession); 
				message.setFrom(new InternetAddress(from)); 
				message.setRecipient(Message.RecipientType.TO, new InternetAddress(strUserEmail)); 
				// 메일 제목 
				message.setSubject("4Way 새 비밀번호", "UTF-8"); 
				// 메일 내용 
				message.setContent(body, "text/html;charset=UTF-8"); 
				// send the message 
				Transport.send(message); 
				//System.out.println("Success Message Send");
				response.sendRedirect("./email_send_ok.jsp");
				
			} catch (MessagingException e) { 
					e.printStackTrace(); 
			}
			
	        //response.sendRedirect("./email_send_ok.jsp");
	        // 보안 수준이 낮은 앱에 대한 액세스가 허용됨
	        // https://myaccount.google.com/lesssecureapps?pli=1&rapt=AEjHL4Po2eimozjWSm0RcN6EO21WmodxcHukbvP6w_j726opoRf20Yrq8eOVu1NMhCgrrhhAPz3AHMwrjJ1nbE0xa4-yZwu34w
			
	        // ===================== 새 비밀번호 전송 ==========================
	        
		}else{
			
			response.sendRedirect("./forgot_Password.jsp?result=N");
		}
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
%>
