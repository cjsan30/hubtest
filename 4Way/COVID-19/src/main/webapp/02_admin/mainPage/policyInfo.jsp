<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.OracleTypes" %>
<%
	request.setCharacterEncoding("UTF-8");

	String userId = (String)session.getAttribute("userId");
	
	if(userId == null){
		response.sendRedirect("/COVID-19/02_admin/admin_sign_in.jsp");
		return;
	}
	
	Connection con = null;
	CallableStatement csmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String userID = "covid19";
	String userPass = "1";

	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	con = DriverManager.getConnection(url,userID,userPass);
	
	String strProcName = "{call PKG_POLICYS.PROC_MB_SEL(?,?)}";
	csmt = con.prepareCall(strProcName);
	csmt.setString(1, userId);
	csmt.registerOutParameter(2, OracleTypes.CURSOR);
	csmt.execute();

	rs = (ResultSet)csmt.getObject(2);

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
		height:100%;
	}
	#policys span{
		display:block;
		float:left;
		height:29px;
		text-align:center;
		font-size:15px;
		padding:3px 0px 0px 0px;
		font-weight: bold;
	}
	.insShow{
		position:absolute;
		top:40%;
		left:50%;
		transform:translate(-50%,-50%);
		width:40%;
		background-color:#fff;
	}
	.insHide{
		position:absolute;
		top:40%;
		left:50%;
		transform:translate(-50%,-50%);
		width:40%;
		background-color:#fff;
		visibility:hidden;
	}
	#insertForm span{
		display:block;
		float:left;
		height:29px;
		text-align:center;
		font-size:15px;
		padding:3px 0px 0px 0px;
		font-weight: bold;
	}
	.row{
		clear:both;
	}
	#dateFormat span{
		padding:0px;
	}
</style>

<script>
	
	var showIns = function(){
		$("div[class='insHide']").prop("class","insShow");
		
	}
	
	var hideIns = function(){
		$("div[class='insShow']").prop("class","insHide");
		$("#insertForm input").val("");
	}
	
	var goIns = function(){
		var chkVal = true;
		
		$("#insertForm input").each(
			function(){
				if($(this).prop("name") != "P_EDATE" && $(this).prop("name") != "P_LINK" && $(this).prop("name") != ""){
					if($(this).val() == ""){
						chkVal = false;
					}
				}
				
			}
		);
		
		if(chkVal){
			isYN = confirm("저장하시겠습니까?");
			if(isYN){
				$("#insertForm").submit();
			}
			
		}
		else{
			alert("정보를 정확히 입력해주세요");
		}
		
	}
	
	var goUpd = function(p_id){
		var chkVal = true;
		
		$("#" + p_id + " input").each(
			function(){
				if($(this).prop("name") == "P_PRIVATE" || $(this).prop("name") == "P_ENTER" || $(this).prop("name") == "P_REST"){
					if($(this).val() == ""){
						chkVal = false;
					}
				}
				
			}
		);
		
		if(chkVal){
			isYN = confirm("수정하시겠습니까?");
			if(isYN){
				$("#" + p_id).submit();
			}
			
		}
		else{
			alert("정보를 정확히 입력해주세요");
		}
		
		
	}
	
	var goDel = function(p_id){
		isYN = confirm("정말 삭제하시겠습니까?");
		
		if(isYN){
			$("#" + p_id).prop("action","./policyCRUD/policyDel.jsp");
			$("#" + p_id).submit();
		}
		
	}
	
</script>

<link rel="stylesheet" type="text/css" href="/COVID-19/css/easyui.css">
<link rel="stylesheet" type="text/css" href="/COVID-19/css/icon.css">
<link rel="stylesheet" type="text/css" href="/COVID-19/css/demo.css">
<script type="text/javascript" src="/COVID-19/js/jquery.easyui.min.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="buttons">
			<input type="button" value="추가" onclick="showIns();" />
		</div>
		<div id="policys">
			<div class="easyui-accordion" style="width:100%;" id="policyAccordion">
				<div class="row" title="
					<span style='width:29.8%;'>거리두기 단계</span>
					<span style='width:0px;border:1px solid #95B8E7;'></span>
					<span style='width:34%;'>정책 발행일자</span>
					<span style='width:2%;'>~</span>
					<span style='width:34%;'>정책 종료일자</span>
				"></div>
<%
	while(rs.next()){
		String P_LINK = rs.getString("P_LINK");
		if(P_LINK == null){
			P_LINK = "";
		}
		String P_EDATE = rs.getString("P_EDATE");
		if(P_EDATE == null){
			P_EDATE = "";
		}
		
		if(rs.getString("UPDYN").equals("Y")){
%>
				<div class="row" title="
					<span style='width:29.8%;'><%=rs.getString("P_LEVEL") %> 단계</span>
					<span style='width:0px;border:1px solid #95B8E7;'></span>
					<span style='width:34%;'><%=rs.getString("P_SDATE") %></span>
					<span style='width:2%;'>~</span>
					<span style='width:34%;'><%=P_EDATE %></span>
				">
					<form id="<%=rs.getString("P_ID") %>" action="./policyCRUD/policyUpd.jsp" method="post" >
						<div class="row">
							<span style='width:10%;text-align:left;padding-left:30px;'>사적모임</span><span style='width:2%;'>:</span><span style='width:88%;padding:0px;'><input type="text" name="P_PRIVATE" style="padding-left:15px;width:100%;height:27px;border:none;margin-top:1px;" value="<%=rs.getString("P_PRIVATE") %>" /></span>
						</div>
						<div class="row" style="border:1px solid #95B8E7;">
							<span style='width:10%;text-align:left;padding-left:30px;'>유흥시설</span><span style='width:2%;'>:</span><span style='width:88%;padding:0px;'><input type="text" name="P_ENTER" style="padding-left:15px;width:100%;height:27px;border:none;margin-top:1px;" value="<%=rs.getString("P_ENTER") %>" /></span>
						</div>
						<div class="row" style="border:1px solid #95B8E7;">
							<span style='width:10%;text-align:left;padding-left:30px;'>식당,카페</span><span style='width:2%;'>:</span><span style='width:88%;padding:0px;'><input type="text" name="P_REST" style="padding-left:15px;width:100%;height:27px;border:none;margin-top:1px;" value="<%=rs.getString("P_REST") %>" /></span>
						</div>
						<div class="row" style="border:1px solid #95B8E7;">
							<span style='width:10%;text-align:left;padding-left:30px;'>관련링크</span><span style='width:2%;'>:</span><span style='width:88%;padding:0px;'><input type="text" name="P_LINK" style="padding-left:15px;width:100%;height:27px;border:none;margin-top:1px;" value="<%=P_LINK %>" /></span>
						</div>
						<div>
							<input type="hidden" name="P_ID" value="<%=rs.getString("P_ID") %>" />
						</div>
					</form>
					<div class="row" style="border:1px solid #95B8E7;">
						<input type="button" value="삭제" style="float:right;" onclick="goDel('<%=rs.getString("P_ID") %>')">
						<input type="button" value="수정" style="float:right;" onclick="goUpd('<%=rs.getString("P_ID") %>')">
					</div>
				</div>
<%
		}
		else{
%>
				<div class="row" title="
					<span style='width:29.8%;'><%=rs.getString("P_LEVEL") %> 단계</span>
					<span style='width:0px;border:1px solid #95B8E7;'></span>
					<span style='width:34%;'><%=rs.getString("P_SDATE") %></span>
					<span style='width:2%;'>~</span>
					<span style='width:34%;'><%=P_EDATE %></span>
				">
					<form id="<%=rs.getString("P_ID") %>" action="./policyCRUD/policyUpd.jsp" method="post" >
						<div class="row">
							<span style='width:10%;text-align:left;padding-left:30px;'>사적모임</span><span style='width:2%;'>:</span><span style='width:88%;padding:0px;'><input type="text" style="padding-left:15px;width:100%;height:27px;border:none;margin-top:1px;" value="<%=rs.getString("P_PRIVATE") %>" readonly /></span>
						</div>
						<div class="row" style="border:1px solid #95B8E7;">
							<span style='width:10%;text-align:left;padding-left:30px;'>유흥시설</span><span style='width:2%;'>:</span><span style='width:88%;padding:0px;'><input type="text" style="padding-left:15px;width:100%;height:27px;border:none;margin-top:1px;" value="<%=rs.getString("P_ENTER") %>" readonly /></span>
						</div>
						<div class="row" style="border:1px solid #95B8E7;">
							<span style='width:10%;text-align:left;padding-left:30px;'>식당,카페</span><span style='width:2%;'>:</span><span style='width:88%;padding:0px;'><input type="text" style="padding-left:15px;width:100%;height:27px;border:none;margin-top:1px;" value="<%=rs.getString("P_REST") %>" readonly /></span>
						</div>
						<div class="row" style="border:1px solid #95B8E7;">
							<span style='width:10%;text-align:left;padding-left:30px;'>관련링크</span><span style='width:2%;'>:</span><span style='width:88%;padding:0px;'><input type="text" style="padding-left:15px;width:100%;height:27px;border:none;margin-top:1px;" value="<%=P_LINK %>" readonly /></span>
						</div>
						<div>
							<input type="hidden" name="P_ID" value="<%=rs.getString("P_ID") %>" />
						</div>
					</form>
					<div class="row" style="border:1px solid #95B8E7;">
						<input type="button" value="삭제" style="float:right;" onclick="goDel('<%=rs.getString("P_ID") %>')">
					</div>
				</div>
<%
		}
	}
%>
			</div>
		</div>
	</div>
	
	<div style="height:286px;border:2px solid #95B8E7;" class="insHide">
		<div class="row">
			<input type="button" value="등록" style="float:left;" onclick="goIns()">
			<input type="button" value="X" style="float:right;" onclick="hideIns()">
		</div>
		<form id="insertForm" action="./policyCRUD/policyIns.jsp" method="post">
			<div class="row" style="border:1px solid #95B8E7;">
				<span style='width:30%;text-align:left;padding-left:5%;'>거리두기 단계</span><span style='width:2%;'>:</span><span style='width:68%;padding:0px;'><input type="text" name="P_LEVEL" style="padding-left:15px;width:100%;height:27px;border:none;margin-top:1px;" maxlength="1" value="" /></span>
			</div>
			<div class="row" style="border:1px solid #95B8E7;height:108px;border-width:2px 0px 0px 0px;">
				<span style='width:30%;text-align:left;padding-left:5%;'>정책 적용기간</span><span style='width:2%;'>:</span>
				<span class="easyui-panel" style="width:68%;padding-left:15px;border:none;height:100%;" id="dateFormat">
					<input class="easyui-datebox" name="P_SDATE" label="정책 발행일자:" labelPosition="top" style="width:90%;">
					<input class="easyui-datebox" name="P_EDATE" label="정책 종료일자:" labelPosition="top" style="width:90%;">
				</span>
			</div>
			<div class="row" style="border:1px solid #95B8E7;">
				<span style='width:30%;text-align:left;padding-left:5%;'>사적모임</span><span style='width:2%;'>:</span><span style='width:68%;padding:0px;'><input type="text" name="P_PRIVATE" style="padding-left:15px;width:100%;height:27px;border:none;margin-top:1px;" value="" /></span>
			</div>
			<div class="row" style="border:1px solid #95B8E7;">
				<span style='width:30%;text-align:left;padding-left:5%;'>유흥시설</span><span style='width:2%;'>:</span><span style='width:68%;padding:0px;'><input type="text" name="P_ENTER" style="padding-left:15px;width:100%;height:27px;border:none;margin-top:1px;" value="" /></span>
			</div>
			<div class="row" style="border:1px solid #95B8E7;">
				<span style='width:30%;text-align:left;padding-left:5%;'>식당,카페</span><span style='width:2%;'>:</span><span style='width:68%;padding:0px;'><input type="text" name="P_REST" style="padding-left:15px;width:100%;height:27px;border:none;margin-top:1px;" value="" /></span>
			</div>
			<div class="row" style="border:1px solid #95B8E7;">
				<span style='width:30%;text-align:left;padding-left:5%;'>관련링크</span><span style='width:2%;'>:</span><span style='width:68%;padding:0px;'><input type="text" name="P_LINK" style="padding-left:15px;width:100%;height:27px;border:none;margin-top:1px;" value="" /></span>
			</div>
		</form>
	</div>
	
</body>
</html>
