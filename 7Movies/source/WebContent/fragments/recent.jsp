<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="model.MovieBeanDAO"%>
<%@page import="model.MovieBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
	
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
	</head>
	<body>
		<div class="container-fluid mt-5 mb-3 px-lg-5">
		<h2 class="title tund">Aggiunti di recente</h2>
		<% 
			ArrayList<MovieBean> movies = MovieBeanDAO.getRecents();
			if(movies.size() != 0){
		%> 
		<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
		  <div class="carousel-inner">
		    <div class="carousel-item active band">
		    	<div class="card bg-dark text-white rounded">
				  <img class="card-img img-fluid" src="<%= movies.get(0).getFramepath() %>" alt="Card image">
				  <div class="card-img-overlay">
				    <h5 class="card-title recent"><%= movies.get(0).getTitle()%></h5>
				    <p class="card-text recent"><%= movies.get(0).getDescriptionAbbv()%></p>
				    <p class="card-text recent"><%= movies.get(0).getDirector() %>, <%= movies.get(0).getYear() %></p>
				  </div>
				</div>
		    </div>
		    <div class="carousel-item band">
		      	<div class="card bg-dark text-white">
				  <img class="card-img img-fluid" src="<%= movies.get(1).getFramepath() %>" alt="Card image">
				  <div class="card-img-overlay">
				    <h5 class="card-title recent"><%= movies.get(1).getTitle()%></h5>
				    <p class="card-text recent"><%= movies.get(1).getDescriptionAbbv()%></p>
				    <p class="card-text recent"><%= movies.get(1).getDirector() %>, <%= movies.get(1).getYear() %></p>
				  </div>
				</div>
		    </div>
		    <div class="carousel-item band">
		      	<div class="card bg-dark text-white">
				  <img class="card-img img-fluid" src="<%= movies.get(2).getFramepath() %>" alt="Card image">
				  <div class="card-img-overlay">
				    <h5 class="card-title recent"><%= movies.get(2).getTitle()%></h5>
				    <p class="card-text recent"><%= movies.get(2).getDescriptionAbbv()%></p>
				    <p class="card-text recent"><%= movies.get(2).getDirector() %>, <%= movies.get(2).getYear() %></p>
				  </div>
				</div>
		    </div>
		  </div>
		</div>
		<%
			}
		%>
	</div>
	</body>
</html>