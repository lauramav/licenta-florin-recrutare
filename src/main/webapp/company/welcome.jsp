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

<title>Company Dashboard</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- din admin index -->
<title>Dashboard</title>
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

			<font size="4"> <a
				href="http://localhost:8080/resources/index.html"
				style="margin-left: 20px;">Back</a>
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


					<li><a href="${contextPath}/company/newjob"><i class="fa fa-edit "></i>Post a new job</a></li>
					<li><a href="${contextPath}/company/myjobs"><i class="fa fa-briefcase "></i>My posted jobs </a></li>


					<li><a href="FAQ.html"><i class="fa fa-question-circle "></i>FAQ</a></li>
					<li> <a href="#"><i class="fa fa-phone"></i>Contact us</a></li>


				</ul>
			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-lg-12">
						<h2>Company Dashboard</h2>
					</div>
				</div>
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-lg-12 ">
						<div class="alert alert-info">

							<strong>Welcome
								${pageContext.request.userPrincipal.name} ! </strong> You Have No pending
							Task For Today.
						</div>

					</div>
				</div>
				<!-- /. ROW  -->
				<div class="row text-center pad-top">
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
						<div class="div-square">
							<a href="http://localhost:8080/resources/index.html"> <i
								class="fa fa-home fa-5x"></i>
								<h4>Home</h4>
							</a>
						</div>


					</div>

					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
						<div class="div-square">
							<a href="${contextPath}/company/newjob"> <i
								class="fa fa-edit fa-5x"></i>
								<h4>Post a new Job</h4>
							</a>
						</div>


					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
						<div class="div-square">
							<a href="myjobs"> <i class="fa fa-briefcase fa-5x"></i>
								<h4>My Posted Jobs</h4>
							</a>
						</div>


					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
						<div class="div-square">
							<a href="FAQ.html"> <i class="fa fa-question-circle fa-5x"></i>
								<h4>FAQ</h4>
							</a>
						</div>


					</div>

					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="form.html" >
 <i class="fa fa-phone fa-5x"></i>
                      <h4>Contact us! </h4>
                      </a>
                      </div>
                     
                     
                  </div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
						<div class="div-square">
							<a href="blank.html"> <i class="fa fa-comments-o fa-5x"></i>
								<h4>Support</h4>
							</a>
						</div>


					</div>
				</div>
				
				<!-- /. ROW  -->
			</div>
			<!-- /. PAGE INNER  -->
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



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
