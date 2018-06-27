<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>My CV</title>


<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<!-- din admin index -->

<!-- BOOTSTRAP STYLES-->
<link href="../resources/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="../resources/assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="../resources/assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />


<!-- Bootstrap core CSS -->
<link href="../resources/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/normalize.css">
<link rel="stylesheet" href="../resources/css/component.css">
<link rel="stylesheet" href="../resources/css/custom-styles.css">
<link rel="stylesheet" href="../resources/css/font-awesome.css">


<link rel="stylesheet" href="../resources/css/demo.css">
<link rel="stylesheet" href="../resources/css/font-awesome-ie7.css">

</head>
<body>
 

	<div class="header-wrapper">
		<div class="site-name">
			<h1>Ctrl Alt Job</h1>
			<h2>Give yourself the best chance!</h2>
		</div>
	</div>


	<div id="wrapper">
		<div class="navbar navbar-inverse navbar-fixed-top">
		
		<font size="4" >
          <a href="welcome" style="margin-left: 20px;">Back</a>
        
          </font>
		
			<span class="logout-spn" align=right>
				<div class="container">
					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<form id="logoutForm" method="POST"
							action="${contextPath}/employee/logout">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>

						<a onclick="document.forms['logoutForm'].submit()">Logout</a>

					</c:if>
				</div>

			</span>

			<div class="adjust-nav">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".sidebar-collapse" style="left: 10px;">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>



				</div>


			</div>
		</div>

		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="active-link"><a href="welcome"><i
							class="fa fa-desktop "></i>Dashboard </a></li>

					<li><a href="${contextPath}/employee/mycvemployee"><i
							class="fa fa-edit "></i>My CV </a></li>
					<li><a href="${contextPath}/employee/jobs"><i
							class="fa fa-briefcase "></i>Find job </a></li>

					<li><a href="FAQ.html"><i class="fa fa-question-circle "></i>FAQ</a>
					</li>
					<li><a href="contactus.html"><i class="fa fa-phone"></i>Contact us</a></li>
				</ul>
			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-6">
						<h2 style = "margin-bottom: 20px;">My CV</h2>
					</div>
					<div class="col-md-6">
						<h4> * = Required</h4>
					</div>
				</div>
				
				
				<div class="row" style = "margin-bottom: 10px;">
					<div class="col-md-3">
						<label for="name">* Name:</label>
					</div>
					<div class="col-md-5">
				<form:form method="POST" action="${contextPath}/employee/mycvemployee"
					modelAttribute="cvForm">
					<spring:bind path="name">
						<form:input type="text" required="required"  path="name" class="form-control"
							placeholder="Name"></form:input>
					</spring:bind>
					</div>
				</div>
				
				
				<div class="row" style = "margin-bottom: 10px;">
					<div class="col-md-3">
						<label for="surname">* Surname:</label>
					</div>
					<div class="col-md-5">
					<spring:bind path="surname">
						<form:input type="text" required="required" path="surname" class="form-control"
							placeholder="Surname"></form:input>
					</spring:bind>
					</div>
				</div>


				<div class="row" style = "margin-bottom: 10px;">
					<div class="col-md-3">
						<label for="age">* Age:</label>
					</div>
					<div class="col-md-5">				
					<spring:bind path="age">
						<form:input type="number" required="required" path="age" class="form-control"
							placeholder="Age"></form:input>
					</spring:bind>
					</div>
				</div>
				
				
				<div class="row" style = "margin-bottom: 10px;">
					<div class="col-md-3">
						<label for="experience">* Years of Experience:</label>
					</div>
					<div class="col-md-5">
					<spring:bind path="experience">
						<form:input type="number" required="required" path="experience" class="form-control"
							placeholder="Years of experience"></form:input>
					</spring:bind>
					</div>
				</div>
				
				<div class="row" style = "margin-bottom: 10px;">
					<div class="col-md-3">
						<label for="wanted">Job Wanted:</label>
					</div>
					<div class="col-md-5">
				
					<spring:bind path="wanted">
						<form:input type="text" path="wanted" class="form-control"
							placeholder="Wanted job"></form:input>
					</spring:bind>
					</div>
				</div>
	
	
				<div class="row" style = "margin-bottom: 10px;">
					<div class="col-md-3">
						<label for="education">* Studies:</label>
					</div>
					<div class="col-md-5">
					<spring:bind path="education">
						<form:input type="text" required="required" path="education" class="form-control"
							placeholder="Studies"></form:input>
					</spring:bind>
					</div>
				</div>

				<div class="row" style = "margin-bottom: 10px;">
					<div class="col-md-3">
						<label for="current">Current Job:</label>
					</div>
					<div class="col-md-5">
					<spring:bind path="current">
						<form:input type="text" path="current" class="form-control"
							placeholder="Current job"></form:input>
					</spring:bind>
					</div>
				</div>
				
				<div class="row" style = "margin-bottom: 10px;">
					<div class="col-md-3">
						<label for="email">* Email:</label>
					</div>
					<div class="col-md-5">
					<spring:bind path="email">
						<form:input type="email" required="required" path="email" class="form-control"
							placeholder="Email"></form:input>
					</spring:bind>
					</div>
				</div>
					

					<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
				</form:form>

			</div>
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>


	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="../resources/assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="../resources/assets/js/bootstrap.min.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="../resources/assets/js/custom.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
</body>
</html>
