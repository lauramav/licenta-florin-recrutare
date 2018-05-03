<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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


					<li><a href="mycv"><i class="fa fa-edit "></i>My CV </a></li>
					<li><a href="blank.html"><i class="fa fa-briefcase "></i>Find
							job </a></li>


					<li><a href="#"><i class="fa fa-qrcode "></i>My Link One</a></li>
					<li><a href="#"><i class="fa fa-bar-chart-o"></i>My Link
							Two</a></li>

					<li><a href="#"><i class="fa fa-edit "></i>My Link Three </a>
					</li>
					<li><a href="#"><i class="fa fa-table "></i>My Link Four</a></li>
					<li><a href="#"><i class="fa fa-edit "></i>My Link Five </a></li>
				</ul>
			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>My CV</h2>
					</div>
				</div>

				<form:form method="POST" modelAttribute="cvForm">
					<spring:bind path="name">
						<div class="form-group">
							<form:input type="text" path="name" class="form-control"
								placeholder="Prenume" autofocus="true"></form:input>
						</div>
					</spring:bind>
					
					<spring:bind path="surname">
						<div class="form-group">
							<form:input type="text" path="surname" class="form-control"
								placeholder="Nume de familie" autofocus="true"></form:input>
						</div>
					</spring:bind>
					
					
					<spring:bind path="age">
						<div class="form-group">
							<form:input type="text" path="age" class="form-control"
								placeholder="Varsta" autofocus="true"></form:input>
						</div>
					</spring:bind>
					
					
					<spring:bind path="experience">
						<div class="form-group">
							<form:input type="text" path="experience" class="form-control"
								placeholder="Ani experienta" autofocus="true"></form:input>
						</div>
					</spring:bind>
					
					
					<spring:bind path="wanted">
						<div class="form-group">
							<form:input type="text" path="wanted" class="form-control"
								placeholder="Job cautat" autofocus="true"></form:input>
						</div>
					</spring:bind>
					
					
					<spring:bind path="education">
						<div class="form-group">
							<form:input type="text" path="education" class="form-control"
								placeholder="Studii" autofocus="true"></form:input>
						</div>
					</spring:bind>
					
					
					<spring:bind path="current">
						<div class="form-group">
							<form:input type="text" path="current" class="form-control"
								placeholder="Job curent" autofocus="true"></form:input>
						</div>
					</spring:bind>
					
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
