<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("userId", "busan051");
%>
<%
	String userId = (String)session.getAttribute("userId");
	if(userId == null){
		response.sendRedirect("./admin_sign_in.jsp");
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
		border:1px solid #aaa;
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
		border:1px solid #566270;
		background-color:#eee;
		color:#566270;
	}
	.menus:visited{
		display:block;
		margin:20px 0px 0px 9%;
		padding:15px 0px 15px 0px;
		width:80%;
		font-size:20px;
		text-align:center;
		border-radius:15px;
		border:1px solid #566270;
		background-color:#eee;
		color:#566270;
	}
	.menus:hover{
		display:block;
		margin:20px 0px 0px 9%;
		padding:15px 0px 15px 0px;
		width:80%;
		font-size:20px;
		text-align:center;
		border-radius:15px;
		border:1px solid #566270;
		background-color:#ccc;
		color:white;
	}
	.menus:active{
		display:block;
		margin:20px 0px 0px 9%;
		padding:15px 0px 15px 0px;
		width:80%;
		font-size:20px;
		text-align:center;
		border-radius:15px;
		border:1px solid #566270;
		background-color:#aaa;
		color:white;
	}
	.inmenu{
		display:block;
		margin:20px 0px 0px 9%;
		padding:15px 0px 15px 0px;
		width:80%;
		font-size:20px;
		text-align:center;
		border-radius:15px;
		border:1px solid #566270;
		background-color:#999;
		color:white;
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
		</div>
		<div id="contents">
			<iframe name="content" style="overflow:auto;">
			</iframe>
		</div>
	</div>
</body>
</html>