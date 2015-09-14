<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
    prefix="springForm"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<title><spring:message code="label.title" /></title>
	
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
		
		<!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

	
	  
</head>
<body>

 

		 	<!-- static navbar -->
		 	
	<nav class="navbar navbar-default navbar-static-top">			 	
		<div class="col-md-8">			 	
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index"><spring:message code="label.title" /></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="<c:url value="/logout" />"><spring:message code="label.logout" /><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><spring:message code="label.language" /> <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="index?lang=en">English</a></li>
                <li><a href="index?lang=uk">Ukrainian</a></li>
              </ul>
            </li>
          </ul>
        
        </div><!--/.nav-collapse -->
     	</div>	
      		<div class="col-md-4">
      			
      		</div>	
		</nav>
	
			
	<div class="container">
		<div class="cont-inner">
		<div class="jumbotron">
	
			<div class="raw">
		
				<form class="form-box" action="search" method="get">
  		   			<div class="form-group">
					 	<input name="dataName" type="text" class="form-control input-lg" placeholder="search by name , lastname, email..."/>
						 <input type="submit" value="<spring:message code="label.search" />" class="btn" />
			  		</div>
				</form>
			</div>
  		   		<div class="row">
					 <h3></h3>
					 <div class="panel panel-default">
					  <!-- Default panel contents -->
					  <div class="panel-heading"><spring:message code="label.searchResult" /></div>
					  <div class="panel-body">
					    	<div class="col-md-6 span3" style="overflow:auto; height:300px; width:100% ">
                              <table class="table table-striped">
                                <thead>
                                  <tr>
                                    <th>#</th>
                                    <th><spring:message code="label.firstname" />	
                                    </th>
                                    <th><spring:message code="label.email" />
                                    </th>
                                    <th><spring:message code="label.telephone" />
                                    </th>
                                  </tr>
                                </thead>
                         <c:if test="${!empty foundContactList}"> 
                          <c:forEach items="${foundContactList}" var="cont"> 
                           		<tbody>
                                  <tr>
                                    <td><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>
                                    <td>${cont.lastname}, ${cont.firstname}</td>
                                    <td>${cont.email}</td>
                                    <td>${cont.telephone}</td>
                                  </tr>
                                  
                                <c:if test="${empty cont.lastname}">  
                                  <tr>
                                    <td>${cont.message}</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                   </tr> 
                                  </c:if>   
                                 </tbody>
                             </c:forEach>  
                            </c:if>        
                              </table>			  
						  </div>
  						</div>
					 	  
					 </div>
				</div>
			</div>
			</div>
		
      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
       	   <div class="row">
  		   		<div class="col-sm-4">
				
		   			  <div class="form-box">
			                    <springForm:form method="post" action="add" class="login-form" commandName="contact">
			       					<c:if test="${!empty contact.firstname}">
			       					<div class="form-group">
			                 
			                        	<springForm:input path="id" readonly="true" disabled="true" class="form-username form-control" id="form-username"/>
			                        	<springForm:hidden path="id" />
			                        </div>
			                        </c:if>
			                    	<div class="form-group">	
			                        	<springForm:input path="firstname" placeholder="first name..." class="form-username form-control" id="form-username"/>
			                        	<springForm:errors path="firstname" cssClass="error" />
			                      	</div>
			                      	<div class="form-group">
			                        	<springForm:input path="lastname" placeholder="last name..." class="form-username form-control" id="form-password"/>
			                        	<springForm:errors path="lastname" cssClass="error" />
			                        </div>	
			                       <div class="form-group">
			                        	<springForm:input path="email" placeholder="email..." class="form-control" id="exampleInputEmail1"/>
			                        	<springForm:errors path="email" cssClass="error" />
			                        </div>
			                        <div class="form-group">
			                        	<springForm:input path="telephone" placeholder="phone..." class="form-control" />
			                        	<springForm:errors path="telephone" cssClass="error" />
			                        </div>
			                        <c:if test="${!empty contact.firstname}">
			                        <input type="submit" class="btn" value="<spring:message code="label.updatecontact"/>" />
			                        </c:if>
			                 		<c:if test="${empty contact.firstname}">
									<input type="submit" class="btn btn-defaul" value="<spring:message code="label.addcontact"/>" />
									</c:if>
			                    </springForm:form>
		                    </div>
							
							<!-- 
							
							
								  			<h3><spring:message code="label.contacts" /></h3>
                            <c:if test="${!empty contactList}">
                            	<table class="data">
                            		<tr>
                            			<th><spring:message code="label.firstname" /></th>
                            			<th><spring:message code="label.email" /></th>
                            			<th><spring:message code="label.telephone" /></th>
                            			<th>&nbsp;</th>
                            		</tr>
                            		<c:forEach items="${contactList}" var="contact">
                            			<tr>
                            				<td>${contact.lastname}, ${contact.firstname}</td>
                            				<td>${contact.email}</td>
                            				<td>${contact.telephone}</td>
                            				<td><a href="delete/${contact.id}"><spring:message code="label.delete" /></a></td>
                            			</tr>
                            		</c:forEach>
                            	</table>
                            </c:if>
							
							
							
							
							
							
							
							
							-->
		   
		   
		   		  </div>
		   		 
		   		  		<div class="col-sm-8">
					 <h3><spring:message code="label.contacts" /></h3>
					 	  <div class="col-md-6 span3" style="overflow:auto; height:300px; width:100% ">
                              <table class="table table-striped">
                                <thead>
                                  <tr>
                                    <th>#</th>
                                    <th><spring:message code="label.firstname" />
                                    	 <select class="btn-mini" onChange="window.location.href=this.value">
											<option value=""></option>
						    				<option value="sortByNameDesc"><spring:message code="label.sortasc" /></option>
						    				<option value="sortByNameAsc"><spring:message code="label.sortdesc" /></option>
										</select>
										<span class="caret_sort"></span>
                                    </th>
                                    <th><spring:message code="label.email" />
                                    	<select class="btn-mini" onChange="window.location.href=this.value">
											<option value=""></option>
						    				<option value="sortByEmailAsc"><spring:message code="label.sortasc" /></option>
						    				<option value="sortByEmailDesc"><spring:message code="label.sortdesc" /></option>
										</select>
										<span class="caret_sort"></span>
                                    
                                    </th>
                                    <th><spring:message code="label.telephone" />
                                    	<select class="btn-mini" onChange="window.location.href=this.value">
											<option value=""></option>
						    				<option value="sortByPhoneAsc"><spring:message code="label.sortasc" /></option>
						    				<option value="sortByPhoneDesc"><spring:message code="label.sortdesc" /></option>
										</select>
										<span class="caret_sort"></span>
                                    </th>
									<th>&nbsp; </th>
									<th>&nbsp; </th>
                                  </tr>
                                </thead>
                           <c:if test="${!empty contactList}">
                           		<tbody>
								<c:forEach items="${contactList}" var="contact">
                                  <tr>
                                    <td>${contact.id}</td>
                                    <td>${contact.lastname}, ${contact.firstname}</td>
                                    <td>${contact.email}</td>
                                    <td>${contact.telephone}</td>
									<td><span class="glyphicon glyphicon-trash" aria-hidden="true"></span><a href="delete/${contact.id}"><spring:message code="label.delete" /></a></td>
									<td><span class="glyphicon glyphicon-erase" aria-hidden="true"></span><a href="edit/${contact.id}"><spring:message code="label.edit" /></a></td>
                                  </tr>
								 </c:forEach> 
                                </tbody>
                              </c:if>
                              </table>
                  
						  </div>
					 
					 </div>
		   		  
		   		  </div>
				  		
 		  		   	 
		 </div>
      </div>

    
				  
		
</body>
</html>