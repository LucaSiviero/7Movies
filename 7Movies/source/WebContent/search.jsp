<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.util.*"%>
<%@page import="model.MovieBean"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>7Movies - Search</title>
	</head>
<body>
	<%@include file="./fragments/header.jsp"%>
	<div class="container col-lg-8 col-md-12 col-sm-12 top">
	<%
		ArrayList<MovieBean> movies1 = null;
		ArrayList<MovieBean> movies2 = null;
		ArrayList<MovieBean> movies3 = null;
		ArrayList<MovieBean> movies4 = null;
	%>
	<%
		String word = (String) session.getAttribute("word");
		movies1 = (ArrayList<MovieBean>) s.getAttribute("titleMovie");
	
		if(movies1 != null && word != "" && word != null){ %>
			<h2 class="title">Film con "<%= word %>" nel titolo:</h2>
			<div class="row mt-3 mb-5">
				<% 
				for(int i = 0; i < movies1.size(); i++){
				%> 
				<div class="col-lg-3 col-md-6 col-sm-6 my-2" >
				  <img class="card-img-top img-fluid rounded" src="<%= movies1.get(i).getImgpath() %>" alt="Card image cap">
				  <div class="card-body">
				    <h5 class="card-title"><a href="movieinfo.jsp?movie=<%=movies1.get(i).getId()%>"><%= movies1.get(i).getTitle() %></a></h5>
				    <p class="card-text"><%= movies1.get(i).getDescriptionAbbv()%></p>
				    <div class="row">
				    	<a class="input-group-text float-right" id="basic-addon2 inputGroup-sizing-sm"><%= movies1.get(i).getPrice()%>EUR</a>
				    	<a href="AddCart?mov=<%=movies1.get(i).getId()%>" class="btn btn-primary float-left"><i class="fas fa-cart-plus"></i></a>
				    </div>
				  </div>
				</div>
			<%
			}
			%>
		</div>	
		<%
		}
		
		movies2 = (ArrayList<MovieBean>) s.getAttribute("dirMovie");
		
		if(movies2 != null && word != "" && word != null){ %>
			<h2 class="title">Film diretti da "<%= word %>":</h2>
			<div class="row mt-3 mb-5">
				<% 
				for(int i = 0; i < movies2.size(); i++){
				%> 
				<div class="col-lg-3 col-md-6 col-sm-6 my-2" >
				  <img class="card-img-top img-fluid rounded" src="<%= movies2.get(i).getImgpath() %>" alt="Card image cap">
				  <div class="card-body">
				    <h5 class="card-title"><a href="movieinfo.jsp?movie=<%=movies2.get(i).getId()%>"><%= movies2.get(i).getTitle() %></a></h5>
				    <p class="card-text"><%= movies2.get(i).getDescriptionAbbv()%></p>
				    <div class="row">
				    	<a class="input-group-text float-right" id="basic-addon2 inputGroup-sizing-sm"><%= movies2.get(i).getPrice()%>EUR</a>
				    	<a href="AddCart?mov=<%=movies2.get(i).getId()%>" class="btn btn-primary float-left"><i class="fas fa-cart-plus"></i></a>
				    </div>
				   </div>
				</div>
			<%
			}
			%>
		</div>	
		<%
		}
		movies3 = (ArrayList<MovieBean>) s.getAttribute("catMovie");
		
		if(movies3 != null && word != "" && word != null){ %>
			<h2 class="title">Film nella categoria "<%= word %>":</h2>
			<div class="row mt-3 mb-5">
				<% 
				for(int i = 0; i < movies3.size(); i++){
				%> 
				<div class="col-lg-3 col-md-6 col-sm-12" >
				  <img class="card-img-top img-fluid rounded" src="<%= movies3.get(i).getImgpath() %>" alt="Card image cap">
				  <div class="card-body">
				    <h5 class="card-title"><a href="movieinfo.jsp?movie=<%=movies3.get(i).getId()%>"><%= movies3.get(i).getTitle() %></a></h5>
				    <p class="card-text"><%= movies3.get(i).getDescriptionAbbv()%></p>
					<div class="row">
				    	<a class="input-group-text float-right" id="basic-addon2 inputGroup-sizing-sm"><%= movies3.get(i).getPrice()%>EUR</a>
				    	<a href="AddCart?mov=<%=movies3.get(i).getId()%>" class="btn btn-primary float-left"><i class="fas fa-cart-plus"></i></a>
				    </div>				  
				  </div>
				</div>
			<%
			}
			%>
		</div>	
		<%
		}
		
		movies4 = (ArrayList<MovieBean>) s.getAttribute("yearMovie");
		
		if(movies4 != null && word != "" && word != null){ %>
			<h2 class="title">Film del <%= word %>:</h2>
				<div class="row mt-3 mb-5">
				<% 
				for(int i = 0; i < movies4.size(); i++){
				%> 
				<div class="col-lg-3 col-md-6 col-sm-6 my-2" >
				  <img class="card-img-top rounded img-fluid" src="<%= movies4.get(i).getImgpath() %>" alt="Card image cap">
				  <div class="card-body">
				    <h5 class="card-title"><a href="movieinfo.jsp?movie=<%=movies4.get(i).getId()%>"><%= movies4.get(i).getTitle() %></a></h5>
				    <p class="card-text"><%= movies4.get(i).getDescriptionAbbv() %></p>
				    <div class="row">
				    	<a class="input-group-text float-right" id="basic-addon2 inputGroup-sizing-sm"><%= movies4.get(i).getPrice()%>EUR</a>
				    	<a href="AddCart?mov=<%=movies4.get(i).getId()%>" class="btn btn-primary float-left"><i class="fas fa-cart-plus"></i></a>
				    </div>
				  </div>
				</div>
			<%
			}
			%>
		</div>	
		<%
		}if(movies1 == null && movies2 == null && movies3 == null && movies4 == null){
			if(word == "" || word == null){
		%>
				<h2 class="title">Puoi usare la barra di ricerca per cercare per titolo, regista, categoria o anno.</h2>
			<%}if(word != "" && word != null){%>
				<h2 class="title">Nessun film trovato :(</h2>
			<%
			}
		}
	%>
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