<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session.setAttribute("userId", "busan051");
%>
<%
	request.setCharacterEncoding("UTF-8");

	String userId = (String)session.getAttribute("userId");
	
	if(userId == null){
		response.sendRedirect("/COVID-19/02_admin/admin_sign_in.jsp");
		return;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<script src="/COVID-19/js/jquery-3.6.0.js"></script>

<style>
	body{
		padding:5px 0px 0px 10px;
		margin:0px;
	}
	#wrap{
		clear:both;
	}
	#sideBar{
		float:left;
		width:15%;
	}
	#sideBar a{
		text-decoration:none;
	}
	#contents{
		float:left;
		width:84%;
	}
	#contents iframe{
		width:100%;
		height:920px;
		border:1px solid #95B8E7;
		border-radius:15px;
	}
	.menus{
		display:block;
		margin:20px 0px 0px 9%;
		padding:15px 0px 15px 0px;
		width:80%;
		font-size:20px;
		text-align:center;
		border-radius:15px;
		border:1px solid #95B8E7;
		background-color:#E0ECFF;
		color:#0E2D5F;
	}
	.menus:visited{
		display:block;
		margin:20px 0px 0px 9%;
		padding:15px 0px 15px 0px;
		width:80%;
		font-size:20px;
		text-align:center;
		border-radius:15px;
		border:1px solid #95B8E7;
		background-color:#E0ECFF;
		color:#0E2D5F;
	}
	.menus:hover{
		display:block;
		margin:20px 0px 0px 9%;
		padding:15px 0px 15px 0px;
		width:80%;
		font-size:20px;
		text-align:center;
		border-radius:15px;
		border:1px solid #95B8E7;
		background-color:#fff49d;
		color:#0E2D5F;
	}
	.menus:active{
		display:block;
		margin:20px 0px 0px 9%;
		padding:15px 0px 15px 0px;
		width:80%;
		font-size:20px;
		text-align:center;
		border-radius:15px;
		border:1px solid #95B8E7;
		background-color:#ffe48d;
		color:#0E2D5F;
	}
	.inmenu{
		display:block;
		margin:20px 0px 0px 9%;
		padding:15px 0px 15px 0px;
		width:80%;
		font-size:20px;
		text-align:center;
		border-radius:15px;
		border:1px solid #95B8E7;
		background-color:#ffe48d;
		color:#0E2D5F;
	}
</style>

<script>
	
	var chkCol = function(inmenu){
		$("#sideBar a").prop("class","menus");
		$(inmenu).prop("class","inmenu");
		
	}
	
</script>

</head>
<body>
	<div id="wrap">
		<div id="sideBar">
			<a class="menus" onclick="chkCol(this);" href="./mainPage/myInfo.jsp" target="content">내 정보</a>
			<a class="menus" onclick="chkCol(this);" href="./mainPage/policyInfo.jsp" target="content">정책 관리</a>
			<a class="menus" onclick="chkCol(this);" href="./login/logout.jsp" >로그아웃</a>
		</div>
		<div id="contents">
			<iframe name="content" style="overflow:auto;">
			</iframe>
		</div>
	</div>
</body>
</html>