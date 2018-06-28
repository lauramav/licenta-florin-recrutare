<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%
	Gson gsonObj = new Gson();
	Map<Object, Object> map = null;
	List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
	String dataPoints = null;

	//	try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/dblicenta?autoReconnect=true&useSSL=false", "root", "root");
	Statement statement = connection.createStatement();
	String xVal, yVal;

	ResultSet resultSet = statement.executeQuery("SELECT age , experience FROM dblicenta.employee_cv;");
	while (resultSet.next()) {
		xVal = resultSet.getString("experience");
		yVal = resultSet.getString("age");

		map = new HashMap<Object, Object>();

		map.put("x",  Integer.parseInt(xVal)); 
		map.put("y",  Integer.parseInt(yVal));
		
		list.add(map);
		dataPoints = gsonObj.toJson(list);
	}
//	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 20px;'>    maybe:</div>");
//		out.print(dataPoints);
		
		
	//connection.close();
	//} catch (SQLException e) {
	//		out.println(
	//			"<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	//		dataPoints = null;
	//	}
%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	window.onload = function() {
<%if (dataPoints != null) {%>
	var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled : true,
			exportEnabled : true,
			title : {
				text : "Age and Experience Chart from Database"
			},
			data : [ {
				type : "column", //change type to bar, line, area, pie, etc
				dataPoints: <%out.print(dataPoints);%>
	} ]
		});
		chart.render();
<%}%>
	}
</script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Statistics</title>




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

<div class="navbar navbar-inverse navbar-fixed-top" style="padding-top: 10px; padding-left: 10px">
<font size="4" >
	 <a href="welcome">Back</a>
	 </font>
	 
</div>  

          

	<div class="header-wrapper">
		<div class="site-name">
			<h1>Ctrl Alt Job</h1>
			<h2>Give yourself the best chance!</h2>
		</div>
	</div>
	
	

	<h3 style="margin-left:20px;margin-right:15px; margin-bottom: 10px; margin-top: 10px;">In the following chart we have <strong>"Experiencce"</strong> on the X-axis (horizontal), and <strong>"Age"</strong> on the Y-axis(vertical).  </h3>
	
	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="js/jquery.canvasjs.min.js"></script>
    <script src="js/canvasjs.min.js"></script>
</body>
</html>

