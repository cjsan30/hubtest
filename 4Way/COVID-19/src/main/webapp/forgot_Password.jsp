<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
	  <style>
	  	body {
			background-color: #566270;
			font-size: 0.875em;
			overflow-x: hidden;
			color: #455a64;
			font-family: "Open Sans", sans-serif;
			background-attachment: fixed;
			background-image: linear-gradient(rgba(255, 255, 255, 0.2) 50%, rgba(255, 255, 255, 0.9) 0%);
		}
		.card .card-block {
		    padding: 20px;
		}
		.login-block {
			margin: 15% auto;
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
		/*
		.form-group {
			margin-bottom: 1.25em;
		}
		*/
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
		    width: 100%;
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
      <script>
	   
	    function signIn(){
	    	
	    	document.getElementById("form").submit();
	    }
      </script>
</head>
<body>
    <section class="login-block">
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                        <form id="form" class="md-float-material form-material" action="./login_ok.jsp" method="post">
                            <div class="text-center">
                                <!-- <img src="assets/images/logo.png" alt="logo.png"> -->
                            </div>
                            <div class="auth-box card">
                                <div class="card-block">
                                    <div class="row m-b-20">
                                        <div class="col-md-12">
                                            <h3 class="text-center">Forgot Password</h3>
                                        </div>
                                    </div>
                                    <div class="form-group form-primary">
                                        <input type="text" name="email" class="form-control">
                                        <span class="form-bar"></span>
                                        <label class="float-label">Id</label>
                                    </div>
                                    <div class="form-group form-primary">
                                        <input type="password" name="password" class="form-control">
                                        <span class="form-bar"></span>
                                        <label class="float-label">E-mail</label>
                                    </div>
                                    <div class="row m-t-25 text-left">
                                        <div class="col-12">
                                            <div class="checkbox-fade fade-in-primary d-">
                                                <label>
                                                    <!-- <input type="checkbox" value=""> -->
                                                    <!-- checkbox 테두리 -->
                                                    <!-- <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span> -->
                                                    <!-- <span class="text-inverse">Remember me</span> -->
                                                </label>
                                            </div>
                                            <div class="forgot-phone text-right f-right">
                                                <!-- <a href="auth-reset-password.html" class="text-right f-w-600"> Forgot Password?</a> -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-t-30">
                                        <div class="col-md-12">
                                            <button type="button" class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20" onclick="signIn();">
                                            	Find Password
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
    <!-- Warning Section Starts -->
    <!-- Older IE warning message -->

<!-- Warning Section Ends -->
<!-- Required Jquery -->
<script type="text/javascript" src="assets/js/jquery/jquery.min.js "></script>
<script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js "></script>
<script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js "></script>
<!-- waves js -->
<script src="assets/pages/waves/js/waves.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
<script type="text/javascript" src="assets/js/common-pages.js"></script>

</body>
</html>