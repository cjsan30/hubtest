<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.OracleTypes" %>
<%
	String userId = (String)session.getAttribute("userId");

	Connection con = null;
	CallableStatement csmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String userID = "FOURWAY";
	String userPass = "1";
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		con = DriverManager.getConnection(url,userID,userPass);
		
		String strProcName = "{call PKG_POLICYS.PROC_MB_SEL(?,?)}";
		csmt = con.prepareCall(strProcName);
		csmt.setString(1, userId);
		csmt.registerOutParameter(2, OracleTypes.CURSOR);
		
		rs = (ResultSet)csmt.getObject(2);
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정책 관리</title>

<script src="/COVID-19/js/jquery-3.6.0.js"></script>

<style>
	body{
		padding:5px 10px 0px 10px;
		margin:0px;
	}
	#wrap{
		clear:both;
		border:1px solid red;
	}
	#policys span{
		display:block;
		float:left;
		border:1px solid blue;
	}
	.row{
		clear:both;
	}
</style>

<script>

	
	
</script>
<link rel="stylesheet" type="text/css" href="/COVID-19/css/easyui.css">
<link rel="stylesheet" type="text/css" href="/COVID-19/css/icon.css">
<link rel="stylesheet" type="text/css" href="/COVID-19/css/demo.css">
<script type="text/javascript" src="/COVID-19/js/jquery.easyui.min.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="buttons">
			<input type="text" /><input type="button" value="조회" />
			<input type="button" value="수정" />
			<input type="button" value="추가" />
			<input type="button" value="삭제" />
		</div>
		<div id="policys">
			<div class="easyui-accordion" style="width:100%;height:100%;">
				<div title="<span style='width:30%;'>정책 발행일자</span><span>정책 종료일자</span><span>거리두기 단계</span>">
				</div>
			</div>
			<div class="easyui-accordion" style="width:100%;height:100%;">
				<div title="<span>정책 발행일자</span><span>정책 종료일자</span><span>거리두기 단계</span>">
					aaa
				</div>
			</div>
		</div>
	</div>
</body>
</html>