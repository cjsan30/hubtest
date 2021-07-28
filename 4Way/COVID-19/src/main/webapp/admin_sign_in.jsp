<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign in</title>
	  <style>
	  	body {
			background-color: #448aff;
			font-size: 0.875em;
			overflow-x: hidden;
			color: #455a64;
			font-family: "Open Sans", sans-serif;
			background-attachment: fixed;
			background-image: linear-gradient(rgba(255, 255, 255, 0.2) 180px, rgba(255, 255, 255, 0.9) 0%);
		}
		.login-block {
			margin: 30px auto;
		}
		
		.login-block .auth-box {
			margin: 20px auto 0 auto;
			max-width: 450px;
		}
		
		.login-block .auth-box .confirm h3 {
			color: #448aff;
			font-size: 34px;
		}
		
		.login-block .auth-box i.icofont-check-circled {
			font-size: 42px;
		}
		
		.login-block.offline-404 .auth-box {
			max-width: 650px;
		}
		
		.login-block.offline-404 .auth-box h1 {
			color: #2c3e50;
			font-size: 160px;
			font-weight: 500;
			letter-spacing: 5px;
			text-shadow: 3px -2px 4px rgba(128, 128, 128, 0.57);
		}
		.col-sm-12 {
			-webkit-box-flex: 0;
			-ms-flex: 0 0 100%;
			flex: 0 0 100%;
			max-width: 100%;
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
		@media only screen and (max-width: 992px) {
			.card-block [class*="col-"]:last-child .basic-list,
			.card-block [class*="col-"]:nth-last-child(-n+3) .card.user-card {
				margin-bottom: 0;
			}
		}
		.m-b-20 {
			margin-bottom: 20px;
		}
		.col-md-12 {
			-webkit-box-flex: 0;
			-ms-flex: 0 0 100%;
			flex: 0 0 100%;
			max-width: 100%;
		}
		.form-group {
			margin-bottom: 1.25em;
		}
		
		.form-group .form-control-lg {
			font-size: 1.25em;
		}
		
		.form-group .form-control-round {
			border-radius: 50px;
		}
		
		.form-group .form-control-static:focus {
			outline: none;
		}
		.form-material .form-group {
			position: relative;
		}
		
		.form-material .form-group.form-static-label .form-control~.float-label {
			top: -14px;
			font-size: 11px;
		}
		.form-material .material-group .form-group {
			-webkit-box-flex: 1;
			-ms-flex: 1 1 auto;
			flex: 1 1 auto;
			width: 1%;
			margin-bottom: 0;
		}
		.form-material .material-group.material-group-lg .form-control {
			padding: 0.5rem 0;
			font-size: 1.25rem;
			line-height: 1.5;
		}
		.form-material .material-group.material-group-lg .form-control:focus~.float-label,
		.form-material .material-group.material-group-lg .form-control:valid~.float-label {
			top: -15px;
			font-size: 14px;
		}
		.form-material .form-primary .form-control:focus~.form-bar:after,
		.form-material .form-primary .form-control:focus~.form-bar:before {
			background: #448aff;
		}
		.form-material .form-primary.form-static-label .float-label {
			color: #448aff;
		}
		.form-material .form-warning.form-static-label .float-label {
			color: #ffe100;
		}
		.form-material .form-default.form-static-label .float-label {
			color: #d6d6d6;
		}
		.form-material .form-danger.form-static-label .float-label {
			color: #ff5252;
		}
		.form-material .form-success.form-static-label .float-label {
			color: #11c15b;
		}
		.form-material .form-inverse.form-static-label .float-label {
			color: #37474f;
		}
		.form-material .form-info.form-static-label .float-label {
			color: #00bcd4;
		}
		.pcoded .pcoded-navbar[navbar-theme="theme1"] .float-label {
			color: #fff;
		}
		.form-material .form-group.form-static-label .form-control~.float-label {
			top: -14px;
			font-size: 11px;
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
		.form-material .material-group.material-group-lg .float-label {
			font-size: 1.25rem;
		}
		.form-material .material-group.material-group-sm .form-control:focus~.float-label,
		.form-material .material-group.material-group-sm .form-control:valid~.float-label {
			top: -9px;
			font-size: 11px;
		}
		.form-material .material-group.material-group-sm .float-label {
			font-size: 0.775rem;
		}
		
		.form-material .form-control:focus~.float-label,
		.form-material .form-material .form-control:valid~.float-label {
			top: 12px;
			font-size: 14px;
		}
		
		.form-material .form-control.fill~.float-label,
		.form-material .form-material .form-control.fill~.float-label {
			top: -14px;
			font-size: 11px;
		}
		.m-t-25 {
			margin-top: 25px;
		}
		.table-card .card-block .table .chk-option .checkbox-fade,
		.table-card .card-block .table .chk-option .checkbox-fade .cr{
			margin-right: 0;
		}
		.checkbox-fade.fade-in-primary .cr{
			border: 2px solid #448aff;
		}
		.checkbox-fade.fade-in-primary .cr .cr-icon{
			color: #448aff;
		}
		.checkbox-fade label input[type="checkbox"]:checked+.cr>.cr-icon{
			-webkit-transform: scale(1) rotateZ(0deg);
			transform: scale(1) rotateZ(0deg);
			opacity: 1;
		}
		.checkbox-fade label input[type="checkbox"]+.cr>.cr-icon{
			-webkit-transform: scale(3) rotateZ(-20deg);
			transform: scale(3) rotateZ(-20deg);
			opacity: 0;
			-webkit-transition: all 0.3s ease-in;
			transition: all 0.3s ease-in;
		}
		.checkbox-fade .cr .cr-icon{
			color: #448aff;
			font-size: 0.8em;
			left: 0;
			line-height: 0;
			position: absolute;
			right: 0;
			text-align: center;
			top: 50%;
		}
		.checkbox-fade label input[type="checkbox"]:checked+.cr>.cr-icon{
			-webkit-transform: scale(1) rotateZ(0deg);
			transform: scale(1) rotateZ(0deg);
			opacity: 1;
		}
		.checkbox-fade label input[type="checkbox"]+.cr>.cr-icon{
			-webkit-transform: scale(3) rotateZ(-20deg);
			transform: scale(3) rotateZ(-20deg);
			opacity: 0;
			-webkit-transition: all 0.3s ease-in;
			transition: all 0.3s ease-in;
		}
		.checkbox-fade.fade-in-primary .cr .cr-icon{
			color: #448aff;
		}
		.checkbox-fade.fade-in-default .cr .cr-icon{
			color: #d6d6d6;
		}
		.checkbox-fade.fade-in-danger .cr .cr-icon{
			color: #ff5252;
		}
		.checkbox-fade.fade-in-success .cr .cr-icon{
			color: #11c15b;
		}
		.checkbox-fade.fade-in-inverse .cr .cr-icon{
			color: #37474f;
		}
		.checkbox-fade.fade-in-info .cr .cr-icon{
			color: #00bcd4;
		}
		.icofont-rounded-down {
			display: inline-block;
			-webkit-transition: all ease-in 0.3s;
			transition: all ease-in 0.3s;
		}
		.icofont.icofont-envelope {
			font-size: 20px;
		}
		.login-block .auth-box i.icofont-check-circled {
			font-size: 42px;
		}
		.form-txt-primary {
			color: #448aff;
		}
		
		.form-txt-primary:focus {
			color: #448aff;
		}
		
		.form-txt-primary::-moz-placeholder {
			color: #448aff;
			opacity: 1;
		}
		
		.form-txt-primary:-ms-input-placeholder {
			color: #448aff;
		}
		
		.form-txt-primary::-webkit-input-placeholder {
			color: #448aff;
		}
		.f-w-600 {
			font-weight: 600;
		}
		.f-w-600 {
			font-weight: 500;
		}
		.text-inverse {
			color: #37474f !important;
		}.
		f-right {
			float: right;
		}
		.m-t-30 {
			margin-top: 30px;
		}
		.col-md-12 {
			-webkit-box-flex: 0;
			-ms-flex: 0 0 100%;
			flex: 0 0 100%;
			max-width: 100%;
		}
		.show>.btn-primary.dropdown-toggle,
		.sweet-alert .show>button.dropdown-toggle.confirm,
		.wizard>.actions .show>a.dropdown-toggle {
			background-color: #0764ff !important;
			border-color: #0764ff;
			-webkit-box-shadow: none;
			box-shadow: none;
			color: #fff;
		}
		.btn-primary,
		.sweet-alert button.confirm,
		.wizard>.actions a {
			background-color: #0764ff;
			border-color: #FFFFF3;
			color: #FFFFF3;
			cursor: pointer;
			-webkit-transition: all ease-in 0.3s;
			transition: all ease-in 0.3s;
		}
		
		.btn-primary:hover,
		.sweet-alert button.confirm:hover,
		.wizard>.actions a:hover {
			background-color: #77aaff;
			border-color: #77aaff;
		}
		
		.btn-primary:active,
		.sweet-alert button.confirm:active,
		.wizard>.actions a:active {
			background-color: #0764ff !important;
			border-color: #FFFFF3;
			-webkit-box-shadow: none;
			box-shadow: none;
			color: #FFFFF3;
		}
		
		.btn-primary:focus,
		.sweet-alert button.confirm:focus,
		.wizard>.actions a:focus {
			-webkit-box-shadow: none;
			box-shadow: none;
			color: #fff;
			background-color: #77aaff;
		}
		
		.btn-primary.disabled,
		.sweet-alert button.disabled.confirm,
		.wizard>.actions a.disabled {
			background-color: rgba(68, 138, 255, 0.5);
			border-color: rgba(68, 138, 255, 0.5);
		}
		.btn-primary.btn-mat,
		.sweet-alert button.btn-mat.confirm,
		.wizard>.actions a.btn-mat {
			background-color: #448aff;
		}
		
		.btn-primary.btn-mat:before,
		.sweet-alert button.btn-mat.confirm:before,
		.wizard>.actions a.btn-mat:before {
			background-color: #0764ff;
		}
		.btn-primary .badge,
		.sweet-alert button.confirm .badge,
		.wizard>.actions a .badge {
			color: #448aff;
			background-color: #fff;
		}
		@media only screen and (max-width: 480px) {
			.mob-product-btn .btn-primary,
			.mob-product-btn .sweet-alert button.confirm,
			.sweet-alert .mob-product-btn button.confirm,
			.mob-product-btn .wizard>.actions a,
			.wizard>.actions .mob-product-btn a {
				margin-right: 0;
				display: block;
				margin: 10px auto;
			}
		}
		.btn-md {
			padding: 10px 16px;
			font-size: 15px;
			line-height: 23px;
		}
		.m-b-20 {
			margin-bottom: 20px;
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
                                            <h3 class="text-center">Sign In</h3>
                                        </div>
                                    </div>
                                    <div class="form-group form-primary">
                                        <input type="text" name="email" class="form-control">
                                        <span class="form-bar"></span>
                                        <label class="float-label">Your Email Address</label>
                                    </div>
                                    <div class="form-group form-primary">
                                        <input type="password" name="password" class="form-control">
                                        <span class="form-bar"></span>
                                        <label class="float-label">Password</label>
                                    </div>
                                    <div class="row m-t-25 text-left">
                                        <div class="col-12">
                                            <div class="checkbox-fade fade-in-primary d-">
                                                <label>
                                                    <input type="checkbox" value="">
                                                    <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                    <span class="text-inverse">Remember me</span>
                                                </label>
                                            </div>
                                            <div class="forgot-phone text-right f-right">
                                                <a href="auth-reset-password.html" class="text-right f-w-600"> Forgot Password?</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-t-30">
                                        <div class="col-md-12">
                                            <button type="button" class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20" onclick="signIn();">
                                            	Sign in
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