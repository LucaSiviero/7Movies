<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>7movies - Login</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

	<link rel="stylesheet" href="./style/main.css">
</head>
<body>
	
	<%@include file="./fragments/header.jsp"%>
	<% if(log.booleanValue()){%>
		</body>
		<head>
			<meta http-equiv="refresh" content="0;URL=index.jsp">
		</head>
	<%}%>
	<section class="container my-5">
			<h1 class="title">Login</h1>
			<form class="col-xs-12 col-lg-6 col-md-8" name="loginform" method="post" action="Login">
			  <div class="form-group">
			    <label for="exampleInputEmail1">Email</label>
			    <input type="email" class="form-control ValidationServer01" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="mario.rossi@mail.com" name="mail" required>
			  	<div class="invalid-feedback">
			        E-mail e password non sono corretti.
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Password</label>
			    <input type="password" class="form-control ValidationServer01" id="exampleInputPassword1" placeholder="Password" name="password" required>
			  </div>
			  
			  <button type="submit" class="btn btn-primary">Login</button>
			  <small id="emailHelp" class="form-text text-muted">Non hai un account? <a href="signup.jsp">Registrati</a></small>
			</form>
	</section>
	
	<%if(request.getParameter("err") != null){%>
				<script>
				$(window).ready(function(){ 	
					    $('.ValidationServer01').addClass("is-invalid");
					setInterval(function(){ 
					    $('.ValidationServer01').removeClass("is-invalid")
					  }, 4500);

					});
				</script>
	<%}%>
</body>
</html>