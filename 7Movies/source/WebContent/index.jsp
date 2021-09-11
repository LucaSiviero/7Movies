<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>7movies - Home</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
	
	<link rel="stylesheet" href="http://localhost:8080/7movies/style/main.css">
	
</head>
<body>
	<%@include file="./fragments/header.jsp"%>
	<div class="container-fluid px-lg-2 px-xl-5">
		<%@include file="./fragments/recent.jsp" %>
		<%@include file="./fragments/catalog.jsp" %>
	</div>
	<% 
		String add = request.getParameter("add");
		if(add != null){
			if(add.equals("1")){
			%>
				<div class="fixed-bottom col-lg-3 col-md-8 alert alert-success alert-dismissible fade show m-5" role="alert">
				  <strong>Aggiunto al carrello!</strong>
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <strong><span aria-hidden="true">&times;</span></strong>
				  </button>
				</div>
			<%
			}if(add.equals("2")){
			%>
				<div class="fixed-bottom col-lg-3 col-md-8 alert alert-warning alert-dismissible fade show m-5" role="alert">
				  <strong>È già nel tuo carrello.</strong>
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <strong><span aria-hidden="true">&times;</span></strong>
				  </button>
				</div>
			<%	
			}if(add.equals("0")){
			%>
				<div class="fixed-bottom col-lg-3 col-md-8 alert alert-danger alert-dismissible fade show m-5" role="alert">
				  <strong>Impossibile aggiungere al carrello :(</strong>
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <strong><span aria-hidden="true">&times;</span></strong>
				  </button>
				</div>
			<%
			}
		}
		%>
</body>
</html>