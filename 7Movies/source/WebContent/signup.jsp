<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>7movies - Signup</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >

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
			<h1 class="title">Registrati</h1>
			<form class="col-xs-12 col-lg-6 col-md-8" name="regform" method="post" action="Signup">
			  <div class="form-group">
			    <label for="exampleInputPassword1">Nome e Cognome</label>
			    <div class="input-group">
					<input type="text" class="form-control" id="exampleInputPassword1" placeholder="Mario" name="name" required>
				 	<input type="text" class="form-control" id="exampleInputPassword1" placeholder="Rossi" name="surname" required>  
			  	</div>
			  </div>
			  <div class="form-group">
			    <label for="ValidationServer01">Email</label>
			    <input type="email" class="form-control" id="ValidationServer01" aria-describedby="emailHelp" placeholder="mario.rossi@mail.com" name="mail" required>
			     <div class="invalid-feedback">
			        L'indirizzo e-mail inserito è già associato ad un altro account.
			      </div>
			    <small id="emailHelp" class="form-text text-muted">Non condivideremo la tua mail con nessuno.</small>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Password</label>
			    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password" required>
			  </div>
			  
			  <button type="submit" class="btn btn-primary">Registrati</button>
			  <small id="emailHelp" class="form-text text-muted">Già registrato? Effettua il <a href="login.jsp">login</a></small>
			</form>
			<% if(request.getParameter("err") != null){%>
				<script>
				$(window).ready(function(){ 	
					    $('#ValidationServer01').addClass("is-invalid");
					setInterval(function(){ 
					    $('#ValidationServer01').removeClass("is-invalid")
					  }, 4500);

					});
				</script>
			<%}%>
	</section>
	
</body>
</html>


