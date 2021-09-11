<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="model.MovieBeanDAO"%>
<%@page import="model.MovieBean"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>7movies - Catalogo</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
	
	<link rel="stylesheet" href="./style/main.css">
</head>
<body>
	<%@include file="./fragments/header.jsp"%>
	<div class="container my-5">
		<input type="hidden" value="<%= request.getRequestURL()%>" name="url">
		<%
		ArrayList<MovieBean> fullCatalog = MovieBeanDAO.getCatalog();
	
		if(fullCatalog != null){ 
		%>
		<div class="row">
			<h2 class="title">Catalogo
			<% if(admin.booleanValue()){ %>
				<a href="insertmovie.jsp" class="btn btn-primary float-right mx-2"><i class="fas fa-plus"></i></a>
			<%}%>
			</h2> 
			
		</div>
			<div class="row">
				<% 
				for(int i = 0; i < fullCatalog.size(); i++){
				%> 
				<div class="col-lg-3 col-md-6 col-sm-6 my-3" id="movie<%=fullCatalog.get(i).getId()%>">
				  <img class="card-img-top img-fluid rounded" src="<%= fullCatalog.get(i).getImgpath() %>" alt="Card image cap">
				  <div class="card-body">
				    <h5 class="card-title"><a href="movieinfo.jsp?movie=<%=fullCatalog.get(i).getId()%>"><%= fullCatalog.get(i).getTitle() %></a></h5>
				    <p class="card-text"><%= fullCatalog.get(i).getDescriptionAbbv()%></p>
				    <div class="row">
					    <a class="input-group-text float-left" id="basic-addon2 inputGroup-sizing-sm"><%= fullCatalog.get(i).getPrice()%>EUR</a>
					    <a href="AddCart?mov=<%=fullCatalog.get(i).getId()%>" class="btn btn-primary float-right"><i class="fas fa-cart-plus"></i></a>
					    <% if(admin.booleanValue()){ %>
							<a href="modmovie.jsp?mov=<%=fullCatalog.get(i).getId()%>" class="btn btn-primary float-right mx-2"><i class="fas fa-edit"></i></a>
						<%}%>
				    </div>
				  </div>
				</div>
			<%
			}
			%>
		</div>	
		<%
		}
		%>
		<% if(log.booleanValue() && !admin.booleanValue()){ %>
		<p class="my-3">Manca il film che stavi cercando? <a href="askmovie.jsp">Richiedilo</a></p>
		<%}%>
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
	</div>
</body>
</html>