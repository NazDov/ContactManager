<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<title><spring:message code="label.title" /></title>
	
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
      
        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/form-elements.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via  -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
	
</head>
<body>

 <!-- Top content -->
        <div class="top-content">
       
            <div class="inner-bg">
                <div class="container">
                 <select onChange="window.location.href=this.value">
					<option value=""></option>
    				<option value="?lang=en">ENG</option>
    				<option value="?lang=uk">UK</option>
				</select>
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong><spring:message code="label.cm.header" /></strong>Login Form</h1>
                            <div class="description">
                            	<h1><spring:message code="label.goto" />
                            	
                            		<a href="<c:url value="/index" />">
			 							<spring:message code="label.contacts" />
			 						</a>
                            	
                            	</h1>
                           
                            	
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3><spring:message code="label.loginMessage" /></h3>
                            		<p><spring:message code="label.loginDetails" /></p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
									<c:if test="${not empty param.error}">
				 					 <font color="red"> <spring:message code="label.loginerror" />
				  						: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} </font>
									</c:if>
							 <form  method="POST" action="<c:url value="/j_spring_security_check"/>" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="j_username"><spring:message code="label.login" /></label>
			                        	<input type="text" name="j_username" placeholder="<spring:message code="label.login" />" class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="j_password"><spring:message code="label.password" /></label>
			                        	<input type="password" name="j_password" placeholder="<spring:message code="label.password" />" class="form-password form-control" id="form-password">
			                        </div>
									<div class="form-group">
										 <label class="sr-only" for="_spring_security_remember_m"><spring:message code="label.remember" /></label>
										 <input type="checkbox" name="_spring_security_remember_me"  value="<spring:message code="label.remember" />"/>
									</div>
			               
									<input type="submit" class="btn" value="<spring:message code="label.enter" />" />
									<input type="reset" class="btn" value="<spring:message code="label.reset" />" />
			
							</form>
		                    </div>
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<h3>...or login with:</h3>
                        	<div class="social-login-buttons">
	                        	<a class="btn btn-link-1 btn-link-1-facebook" href="#">
	                        		<i class="fa fa-facebook"></i> Facebook
	                        	</a>
	                        	<a class="btn btn-link-1 btn-link-1-twitter" href="#">
	                        		<i class="fa fa-twitter"></i> Twitter
	                        	</a>
	                        	<a class="btn btn-link-1 btn-link-1-google-plus" href="#">
	                        		<i class="fa fa-google-plus"></i> Google Plus
	                        	</a>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
      
        </div>


        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->


</body>
</html>