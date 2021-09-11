<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>7movies - Richiedi un film</title>
</head>
<body>
	<%@include file="./fragments/header.jsp"%>
	<% if(!log.booleanValue()){%>
		</body>
		<head>
			<meta http-equiv="refresh" content="0;URL=index.jsp">
		</head>
	<%}%>
	<section class="container my-5">
			<h1 class="title">Richiedi un film</h1>
			<form class="col-xs-12 col-lg-6 col-md-8" name="loginform" method="post" action="Login">
			  <div class="form-group">
			    <label for="exampleInputEmail1">Titolo</label>
			    <input type="email" class="form-control ValidationServer01" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="es. Arancia Meccanica" name="movie" required>
			  	
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Regista</label>
			    <input type="text" class="form-control ValidationServer01" id="exampleInputPassword1" placeholder="es. Stanley Kubrick" name="director" required>
			  </div>
			  
			  <button type="submit" class="btn btn-primary">Invia richiesta</button>
			  <small id="emailHelp" class="form-text text-muted">In questo modo la tua richiesta verrà inoltrata direttamente agli amministratori di 7movies.</small>
			</form>
	</section>
</body>
</html>