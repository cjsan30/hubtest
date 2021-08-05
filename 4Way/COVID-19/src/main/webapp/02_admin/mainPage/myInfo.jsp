<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.OracleTypes" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String PW_YN = request.getParameter("PW_YN");
	String strUserId = (String)session.getAttribute("userId");
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "covid19", "1");
		
		String strProcName = "{call PKG_LOGIN.PROC_VIEW_MYIFO(?,?)}";
		
		CallableStatement csmt = con.prepareCall(strProcName);

		csmt.setString(1, strUserId);
		csmt.registerOutParameter(2, OracleTypes.CURSOR);
		csmt.execute();
		
		ResultSet memberRs = (ResultSet)csmt.getObject(2);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정책 관리</title>

<script src="/COVID-19/js/jquery-3.6.0.js"></script>

<style>
		.container{
			height:100%;
		}
		.card .card-block {
		    padding: 20px;
		}
		.card {
		    position: relative;
		    display: -webkit-box;
		    display: -ms-flexbox;
		    display: flex;
		    -webkit-box-orient: vertical;
		    -webkit-box-direction: normal;
		    -ms-flex-direction: column;
		    flex-direction: column;
		    min-width: 0;
		    word-wrap: break-word;
		    background-color: #FFF;
		    background-clip: border-box;
		    border: 1px solid rgba(0,0,0,.125);
		    border-radius: .25rem;
		}
		.login-block .auth-box {
			margin: 20px auto 0 auto;
			max-width: 500px;
		}
		.text-center {
			text-align: center;
		}
		.text-left {
			text-align: left;
		}
		.text-right {
			text-align: right;
		}
		.m-b-20 {
			margin-bottom: 20px;
		}
		.form-material .form-group {
			position: relative;
		}
		.form-material .float-label {
			pointer-events: none;
			position: absolute;
			top: 12px;
			left: 0;
			font-size: 14px;
			font-weight: 400;
			transition: 0.2s ease all;
			-moz-transition: 0.2s ease all;
			-webkit-transition: 0.2s ease all;
		}
		.form-material .form-control {
		    display: inline-block;
		    height: 43px;
		    width: 80%;
		    border: none;
		    border-radius: 0;
		    font-size: 16px;
		    font-weight: 400;
		    padding: 0;
		    background-color: transparent;
		    box-shadow: none;
		    border-bottom: 1px solid #ccc;
		    /* float:right; */
		}
		.form-material .form-password {
		    display: inline-block;
		    height: 43px;
		    width: 70%;
		    border: none;
		    border-radius: 0;
		    font-size: 16px;
		    font-weight: 400;
		    padding: 0;
		    background-color: transparent;
		    box-shadow: none;
		    border-bottom: 1px solid #ccc;
		}
		.form-material .form-newPW {
		    display: inline-block;
		    height: 43px;
		    width: 97%;
		    border: none;
		    border-radius: 0;
		    font-size: 16px;
		    font-weight: 400;
		    padding: 0;
		    background-color: transparent;
		    box-shadow: none;
		    border-bottom: 1px solid #ccc;
		}
		.m-t-25 {
			margin-top: 25px;
		}
		.icofont-rounded-down {
			display: inline-block;
			-webkit-transition: all ease-in 0.3s;
			transition: all ease-in 0.3s;
		}
		.f-w-600 {
			font-weight: 500;
		}
		.m-t-30 {
			margin-top: 30px;
		}
		.btn:not([disabled]):not(.disabled) {
		    cursor: pointer;
		}
		[type=reset], [type=submit], button, html [type=button] {
		    -webkit-appearance: button;
		}
		@media only screen and (max-width: 480px)
		.btn {
		    padding: 10px 15px;
		}
		.btn {
		    border-radius: 2px;
		    text-transform: capitalize;
		    font-size: 15px;
		    padding: 10px 19px;
		    cursor: pointer;
		}
		.text-center {
		    text-align: center;
		}
		.waves-effect {
		    position: relative;
		    cursor: pointer;
		    display: inline-block;
		    overflow: hidden;
		    -webkit-user-select: none;
		    -moz-user-select: none;
		    -ms-user-select: none;
		    user-select: none;
		    -webkit-tap-highlight-color: transparent;
		}
		.btn-block {
		    display: block;
		    width: 100%;
		}
		.btn-primary {
		    color: #fff;
		    background-color: #007bff;
		    border-color: #007bff;
		}
		.btn {
		    display: inline-block;
		    font-weight: 400;
		    text-align: center;
		    white-space: nowrap;
		    vertical-align: middle;
		    -webkit-user-select: none;
		    -moz-user-select: none;
		    -ms-user-select: none;
		    user-select: none;
		    border: 1px solid transparent;
		    padding: .375rem .75rem;
		    font-size: 1rem;
		    line-height: 1.5;
		    border-radius: .25rem;
		    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
		}
		button, select {
		    text-transform: none;
		}
		button, input {
		    overflow: visible;
		}
		button, input, optgroup, select, textarea {
		    margin: 0;
		    font-family: inherit;
		    font-size: inherit;
		    line-height: inherit;
		}
		button {
		    border-radius: 0;
		}
		[role=button], a, area, button, input:not([type=range]), label, select, summary, textarea {
		    -ms-touch-action: manipulation;
		    touch-action: manipulation;
		}
		*, ::after, ::before {
		    box-sizing: border-box;
		}
		.btn-primary,
		.sweet-alert button.confirm,
		.wizard>.actions a {
			background-color: #566270;
			border-color: #FFFFF3;
			color: #FFFFF3;
			cursor: pointer;
			-webkit-transition: all ease-in 0.3s;
			transition: all ease-in 0.3s;
		}
		.btn-md {
			padding: 10px 16px;
			font-size: 15px;
			line-height: 23px;
		} 
		h3 {
			font-size: 28px;
		}
</style>
<script type="text/javascript" src="/COVID-19/js/jquery.easyui.min.js"></script>
<script>
	
	//var userNewPW = "";
	//var userChkNewPW = "";

	function modify(){
		
		var userNewPW = $("#newPW").val();
		var userChkNewPW = $("#chkNewPW").val();
		
		//var passwordRules = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		//alert(passwordRules.test(userNewPW));
		var checkNum = userNewPW.search(/[0-9]/g); // 숫자사용
		var checkEng = userNewPW.search(/[a-z]/ig); // 영문사용

		  if(checkNum <0 || checkEng <0){
		    
			  alert("숫자와 영문자를 조합하여야 합니다.");
		  }else if(userNewPW.length != 9){
			  
				alert("새 비밀번호는 9자리여야 합니다.");
		  }else {	
			  
			  if(userNewPW != userChkNewPW){
					
					alert("새 비밀번호와 새 비밀번호 확인 값은 같아야 합니다.");
					
				}else{
				
					if($(".result").val() == 'Y'){
						
						$("#myInfoForm").attr("action", "./change_password.jsp");
						$("#myInfoForm").submit();
						$(".result").val("N");
						$("#myInfoForm").attr("action", "./check_password.jsp");
						alert("비밀변호 변경 완료");
						
					}else{
						
						alert("현재 비밀번호 확인을 해주세요.");
					}
				}
				//chksmallLetter(userNewPW, userChkNewPW);
		 }
	
		/*
		if(userNewPW.length != 9){
			alert("새 비밀번호는 9자리여야 합니다.");
		}else{	
			//chksmallLetter(userNewPW, userChkNewPW);
		}
		*/
	}
	/*
	function chksmallLetter(userNewPW, userChkNewPW){
		
		var smallLetter = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 
				'h', 'i', 'j', 'k', 'l', 'm', 'n', 
				'o', 'p', 'q', 'r', 's', 't', 'u', 
				'v', 'w', 'x', 'y', 'z'];
		
		var realchk = 0;
		
		for(var i=0;i<smallLetter.length;i++){
			
			if(userNewPW.indexOf(smallLetter[i], 0) == -1)){
				
				realchk += 1;		
			}
		}
		
		if(realchk == 0){
			
			chkNum(userNewPW, userChkNewPW);
			
		}else{
			
			alert("비밀번호는 알파벳 소문자, 숫자를 포함해야 합니다.");
		}
	}
	
	function chkNum(userNewPW, userChkNewPW){
		
		var num = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
		var realchk = 0;
		
		for(var i=0;i<num.length;i++){
			
			if(userNewPW.indexOf(num[i], 0) == -1)){
				
				realchk += 1;		
			}
		}
		
		if(realchk == 0){
			chkSameNewPW(userNewPW, userChkNewPW);
		}else{
			
			alert("비밀번호는 알파벳 소문자, 숫자를 포함해야 합니다.");
		}
	}
	
	function chkSameNewPW(userNewPW, userChkNewPW){
		
		if(userNewPW != userChkNewPW){
			
			alert("새 비밀번호와 새 비밀번호 확인 값이 다릅니다.");
			
		}else{
		
			if($(".result").val() == 'Y'){
				
				$("#myInfoForm").attr("action", "./change_password.jsp");
				$("#myInfoForm").submit();
				$(".result").val("N");
				$("#myInfoForm").attr("action", "./check_password.jsp");
				
			}else{
				
				alert("현재 비밀번호 확인을 해주세요.");
			}
		}
	}
	*/
	function chkPW(){
		
		$("#myInfoForm").submit();
		
	}

	var showIns = function(){
		$("div[class='insHide']").prop("class","insShow");
		
	}
	
	var hideIns = function(){
		$("div[class='insShow']").prop("class","insHide");
		$("#insertForm input").val("");
	}
	
	
	function chkLogin(result){
		
		//alert(result);
		if(result == 'N'){
			
			alert("패스워드가 일치하지 않습니다.");
			
		}else if(result == 'Y'){
			
			$(".result").val(result);
			$("#PWChkBtn").html("인증완료");
			$("#PWChkBtn").css("background-color", "#007bff");
			$("#PWChkBtn").css("color", "#fff");
			$("#PWChkBtn").prop("disabled", true);
			alert("패스워드 확인 완료.");
		}
	}
	
</script>

</head>
<body onload="chkLogin('<%=PW_YN%>');">
	<section class="login-block">
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                        <form id="myInfoForm" class="md-float-material form-material" action="./check_password.jsp" method="post">
                            <div class="text-center">
                                <!-- <img src="assets/images/logo.png" alt="logo.png"> -->
                            </div>
                            <div class="auth-box card">
                                <div class="card-block">
                                    <div class="row m-b-20">
                                        <div class="col-md-12">
                                            <h3 class="text-center">My Information</h3>
                                        </div>
                                    </div>
                                    <%
										while(memberRs.next()){
									%>
                                    <div class="form-group form-primary">
                                    	<span>아이디&nbsp;&nbsp;&#58;&nbsp;&nbsp;</span>
                                        <input type="text" name="identity" class="form-control" value="<%=memberRs.getString("MB_ID") %>" readonly style="float='right'"/>
                                        <span class="form-bar"></span>
                                        <label class="float-label"></label>
                                    </div>
                                    <div class="form-group form-primary">
                                    	<span>이메일&nbsp;&nbsp;&#58;&nbsp;&nbsp;</span>
                                        <input type="text" name="email" class="form-control" value="<%=memberRs.getString("MB_EMAIL") %>" />
                                        <span class="form-bar"></span>
                                        <label class="float-label"></label>
                                    </div>
                                    <br/>
                                    <div class="form-group form-primary">
                                    	<span>비밀번호 변경&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    </div>
                                    <div class="form-group form-primary" style="clear:both">
                                        <input type="password" name="password" class="form-password" value="" placeholder="현재 비밀번호" />
                                        <span class="form-bar"></span>
                                        <label class="float-label"></label>
                                        <button type="button" id="PWChkBtn" class="btn" onclick="chkPW();">
                                            	비밀번호 확인
                                        </button>
                                        <input type="hidden" value="N" class="result"/>
                                    </div>
                                    <div class="form-group form-primary">
                                        <input type="password" id="newPW" name="newPW" class="form-newPW" placeholder="새 비밀번호" value="" />
                                        <span class="form-bar"></span>
                                        <label class="float-label"></label>
                                    </div>
                                    <div class="form-group form-primary">
                                        <input type="password" id="chkNewPW" name="chkNewPW" class="form-newPW" placeholder="새 비밀번호 확인" value="" />
                                        <span class="form-bar"></span>
                                        <label class="float-label"></label>
                                    </div>
                                    <br/>
                                    <div class="form-group form-primary">
                                    	<span>지역&nbsp;&nbsp;&#58;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                        <input type="text" name="password" class="form-control" value="<%=memberRs.getString("MB_REGION") %>" readonly />
                                        <span class="form-bar"></span>
                                        <label class="float-label"></label>
                                    </div>
                                    <%
										}
                                	
                                	} catch (ClassNotFoundException e) {
                                		// TODO Auto-generated catch block
                                		e.printStackTrace();
                                	} catch (SQLException e) {
                                		// TODO Auto-generated catch block
                                		e.printStackTrace();
                                	}
									%>
                                    <div class="row m-t-30">
                                        <div class="col-md-12">
                                            <button type="button" class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20" onclick="modify();">
                                            	Modify My Information
                                            </button>
                                        </div>
                                    </div>
                                    <hr/>
                                </div>
                            </div>
                        </form>
                        <!-- end of form -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
</body>
</html>
