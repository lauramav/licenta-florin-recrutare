<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="Gavrila Florin">

    <title>Admin Login</title>


	 <!-- Bootstrap core CSS *CA IN INDEX.html -->
    <link href="../resources/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="../resources/css/normalize.css">
    <link rel="stylesheet" href="../resources/css/component.css">
    <link rel="stylesheet" href="../resources/css/custom-styles.css">
    <link rel="stylesheet" href="../resources/css/font-awesome.css">
	
     
	 <link rel="stylesheet" href="../resources/css/demo.css">
    <link rel="stylesheet" href="../resources/css/font-awesome-ie7.css">
	
      <script src="../resources/js/html5shiv.js"></script>
      <script src="../resources/js/respond.min.js"></script>
	
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<c:redirect url = "http://localhost:8080/admin/welcome"/>
		</c:if>
	
</head>

<body>
<div class="navbar navbar-inverse navbar-fixed-top" style="padding-top: 10px; padding-left: 10px">
	 <a href="http://localhost:8080/resources/index.html">Back</a>
</div> 

<div class="header-wrapper">
      <div class="site-name">
        <h1>Ctrl Alt Job</h1>
        <h2>Give yourself the best chance!</h2>
      </div>
    </div>
	 <div class="ruler"></div>
<div class="container">

    <form method="POST" action="${contextPath}/admin/login" class="form-signin">
        <h2 class="form-heading">Log in</h2>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <input name="username" type="text" class="form-control" placeholder="Username"
                   autofocus="true"/>
            <input name="password" type="password" class="form-control" placeholder="Password"/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
           
        </div>

    </form>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
