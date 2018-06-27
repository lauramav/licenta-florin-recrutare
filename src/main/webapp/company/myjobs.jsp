<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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

<title>My posted jobs</title>


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

			<font size="4"> <a
				href="http://localhost:8080/company/welcome"
				style="margin-left: 20px;">Back</a>

			</font> <span class="logout-spn" align=right>
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
					<li><a href="${contextPath}/company/newjob"><i
							class="fa fa-edit "></i>Post a new job</a></li>
					<li><a href="${contextPath}/company/myjobs"><i
							class="fa fa-briefcase "></i>My posted jobs </a></li>
					<li><a href="${contextPath}/company/hireemployee"><i
							class="fa fa-book"></i>Find employee </a></li>
					<li><a href="FAQ.html"><i class="fa fa-question-circle "></i>FAQ</a></li>
					<li><a href="contactus.html"><i class="fa fa-phone"></i>Contact us</a></li>
				</ul>
			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2 style="margin-left: 15px;">My posted jobs</h2>
					</div>
				</div>




				<div class="container" style="margin-top: 20px;">
					<div class="row">


						<div class="col-md-12">
							<div class="table-responsive">

								<table id="mytable" class="table table-bordred table-striped">

									<thead>
										<th>Title</th>
										<th>Description</th>
										<th>Edit</th>
										<th>Delete</th>
									</thead>
									<tbody>

										<c:forEach var="listValue" items="${listOfJobs}">

											<tr>

												<td>${listValue.jobTitle}</td>
												<td>${listValue.jobDescription}</td>

												<td><p data-placement="top" data-toggle="tooltip"
														title="Edit">
														<button class="btn btn-primary btn-xs edit-btn" data-title="Edit" data-href="${contextPath}/company/editjob/${listValue.jobId}">
															<span class="glyphicon glyphicon-pencil"></span>
														</button>
													</p></td>
												<td><p data-placement="top" data-toggle="tooltip"
														title="Delete">
														<button class="btn btn-danger btn-xs delete-btn" data-title="Delete" data-id="${listValue.jobId}">
															<span class="glyphicon glyphicon-trash"></span>
														</button>
													</p></td>
											</tr>
										</c:forEach>


									</tbody>

								</table>

								<div class="clearfix"></div>
								<ul class="pagination pull-right">
									<li class="disabled"><a href="#"><span
											class="glyphicon glyphicon-chevron-left"></span></a></li>
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#"><span
											class="glyphicon glyphicon-chevron-right"></span></a></li>
								</ul>

							</div>

						</div>
					</div>
				</div>


				<div class="modal fade" id="edit" tabindex="-1" role="dialog"
					aria-labelledby="edit" aria-hidden="true"
					style="padding-left: 70px">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								</button>
								<h4 class="modal-title custom_align" id="Heading">Edit The
									Job Post</h4>
							</div>


							<div class="modal-body">
								<form id="edit-form" method="POST" action="${contextPath}/company/editjob">
									<input name="id" type="hidden"></input>
									<div class="form-group">
										<input name="title" required="required" type="text" class="form-control"></input> 
									</div>
									<div class="form-group">
										<input name="description" required="required" type="text" class="form-control"></input>
									</div>
									<div class="modal-footer ">
										<button type="submit" class="btn btn-warning btn-lg"
											style="width: 100%;">
											<span class="glyphicon glyphicon-ok-sign"></span> Update</button>
									</div>
								</form>
							</div>




						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>



				<div class="modal fade" id="delete" tabindex="-1" role="dialog"
					aria-labelledby="edit" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								</button>
								<h4 class="modal-title custom_align" id="Heading">Delete
									this entry</h4>
							</div>
							<div class="modal-body">

								<div class="alert alert-danger">
									<span class="glyphicon glyphicon-warning-sign"></span> Are you
									sure you want to delete this Record?
								</div>

							</div>
							<div class="modal-footer ">
								<form id="delete-form" method="POST" action="${contextPath}/company/deletejob">
									<input name="id" type="hidden"></input>
									<button type="submit" class="btn btn-success">
										<span class="glyphicon glyphicon-ok-sign"></span> Yes
									</button>
								
								<button type="button" class="btn btn-default"
									data-dismiss="modal">
									<span class="glyphicon glyphicon-remove"></span> No
								</button></form>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>









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
	

	<script>
	$('.edit-btn').on('click',function(){
		var dataURL = $(this).attr('data-href');
		$.getJSON(dataURL, function(data) {
			    for (var key in data) {
			        $('#edit-form :input[name="'+key+'"]').val(data[key]);
			    }
			  	$('#edit').modal({show:true});
			});
	});
	
	$('.delete-btn').on('click',function(){
		var id = $(this).attr('data-id');
		$('#delete-form :input[name="id"]').val(id);
		$('#delete').modal({show:true});
	});
	</script>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
</body>
</html>
