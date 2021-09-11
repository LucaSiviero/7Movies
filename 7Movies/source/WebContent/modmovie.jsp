<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.MovieBean"%>
<%@page import="model.MovieBeanDAO"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>7movies - Modifica film
		</title>
		
		<link rel="stylesheet" href="./style/main.css">
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
		
	</head>
	<body>
	<%@include file="./fragments/header.jsp"%>
	
	<% 
	String id = request.getParameter("mov");
	if((!admin.booleanValue()) || (id == null)){ %>
		</body>
		<meta http-equiv="refresh" content="0;URL=index.jsp">
	<%
	}else{
		MovieBean mov = MovieBeanDAO.getMovieById(id);
	%>
	
	<section class="container my-5">
		<h1 class="title">Modifica "<%= mov.getTitle() %>"</h1>
		<form name="mod-movieform" method="post" action ="ModMovie"  class="col-xs-12 col-lg-8 col-md-8">
			<input type="hidden" id="custId" name="id" value="<%= mov.getId()%>">
			<div class="form-group">
		      <label for="validationDefault03">Titolo:</label>
		      <input type="text" class="form-control" id="validationDefault03" value="<%= mov.getTitle() %>" required name="title">
		    </div>
			
			<div class="form-group">
		      <label for="validationDefault03">Regista:</label>
		      <input type="text" class="form-control" id="validationDefault03" value="<%= mov.getDirector() %>" required name="director">
		    </div>
			
			<div class="form-group">
		      <label for="validationDefault03">Anno:</label>
		      <input type="text" class="form-control" id="validationDefault03" value="<%= mov.getYear() %>" required name="year">
		    </div>
			
			<div class="form-group">
		      <label for="validationDefault03">Lingue disponibili:</label>
		      <input type="text" class="form-control" id="validationDefault03" value="<%= mov.getLangs() %>" required name="langs">
		    </div>
			
			<div class="form-group">
				<label for="validationDefault03">Prezzo:</label>
				<div class="input-group mb-3">
				  <input type="number" step="0.01" class="form-control" name="price" value="<%=mov.getPrice()%>"><br>
				  <div class="input-group-append">
				    <span class="input-group-text" id="basic-addon2 inputGroup-sizing-sm">EUR</span>
				  </div>
				</div>
			</div>
			
			<div class="form-group">
		      <label for="validationDefault03">Categorie:</label>
		      <input type="text" class="form-control" id="validationDefault03" value="<%= mov.getCategories() %>" required name="categories">
		    </div>
			
			<div class="form-group">		
				<label for="validationDefault03">Copertina:</label>
				<input type="text" class="form-control" id="validationDefault03" value="<%= mov.getImgpath()%>" required name="img">	
			</div>
			
			<div class="form-group">		
				<label for="validationDefault03">Frame:</label>
				<input type="text" class="form-control" id="validationDefault03" value="<%= mov.getFramepath()%>" required name="frame">	
			</div>
			
			<div class="form-group">		
				<label for="validationDefault03">Descrizione:</label>
				<input type="text" class="form-control" id="validationDefault03" value="<%= mov.getDescription()%>" required name="descr">	
			</div>
			<button type="submit" class="btn btn-primary">Modifica   <i class="fas fa-edit"></i></button>
			
		</form>
		<form name="mod-movieform" method="post" action ="DropMovie"  class="col-xs-12 col-lg-8 col-md-8 my-5" data-toggle="validator" role="form">
		  <input type="hidden" id="custId" name="id" value="<%= mov.getId()%>" required>
		  <div class="form-group form-check">
		    <input type="checkbox" class="form-check-input" id="terms" data-error="Seleziona questa casella se intendi procedere" required>
		    <label class="form-check-label" for="exampleCheck1">Sono sicuro di voler eliminare "<%=mov.getTitle()%>"</label>
		  </div>
		  <div class="help-block with-errors"></div>
		  <div class="form-group">
		     <button type="submit" class="btn btn-primary">Cancella <i class="fas fa-trash-alt"></i></button>
		  </div>
		</form>
		
	</section>
	<% } %>
	</body>
	
</html>