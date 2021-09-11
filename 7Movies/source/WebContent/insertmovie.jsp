<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>7movies - Aggiungi film
		</title>
		
		<link rel="stylesheet" href="./style/main.css">
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
		
	</head>
	<body>
	<%@include file="./fragments/header.jsp"%>
	
	<% if(!admin.booleanValue()){ %>
	</body>
		<head>
		<meta http-equiv="refresh" content="0;URL=index.jsp">
		</head>
	<%}%>
	
	<section class="container my-5">
		<h1 class="title">Inserisci film</h1>
		<form name="insert-movieform" method="post" action ="InsertMovie"  class="col-xs-12 col-lg-8 col-md-8">
			<div class="form-group">
		      <label for="validationDefault03">Titolo:</label>
		      <input type="text" class="form-control" id="validationDefault03" placeholder="Titolo" required name="title">
		    </div>
			
			<div class="form-group">
		      <label for="validationDefault03">Regista:</label>
		      <input type="text" class="form-control" id="validationDefault03" placeholder="Regista" required name="director">
		    </div>
			
			<div class="form-group">
		      <label for="validationDefault03">Anno:</label>
		      <input type="text" class="form-control" id="validationDefault03" placeholder="Anno" required name="year">
		    </div>
			
			<div class="form-group">
		      <label for="validationDefault03">Lingue disponibili:</label>
		      <input type="text" class="form-control" id="validationDefault03" placeholder="Lingue" required name="langs">
		    </div>
			
			<div class="form-group">
				<label for="validationDefault03">Prezzo:</label>
				<div class="input-group mb-3">
				  <input type="number" step="0.01" class="form-control" name="price"><br>
				  <div class="input-group-append">
				    <span class="input-group-text" id="basic-addon2 inputGroup-sizing-sm">EUR</span>
				  </div>
				</div>
			</div>
			
			<div class="form-group">
		      <label for="validationDefault03">Categorie:</label>
		      <input type="text" class="form-control" id="validationDefault03" placeholder="Categorie" required name="categories">
		    </div>
			
			<div class="form-group">		
				<label for="validationDefault03">Copertina:</label>
				<input type="text" class="form-control" id="validationDefault03" placeholder="Link copertina" required name="img">	
			</div>
			
			<div class="form-group">		
				<label for="validationDefault03">Frame:</label>
				<input type="text" class="form-control" id="validationDefault03" placeholder="Link frame" required name="frame">	
			</div>
			
			<div class="form-group">		
				<label for="validationDefault03">Descrizione:</label>
				<input type="text" class="form-control" id="validationDefault03" placeholder="Descrizione" required name="descr">	
			</div>
			<button type="submit" class="btn btn-primary">Inserisci</button>
			
		</form>
	</section>
	</body>
</html>