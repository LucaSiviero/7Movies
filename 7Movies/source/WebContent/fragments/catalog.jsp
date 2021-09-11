<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="model.MovieBeanDAO"%>
<%@page import="model.MovieBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	
	<div class="px-xl-5 my-5">
	<%
		ArrayList<MovieBean> catalog = MovieBeanDAO.getCatalogPreview();
	
		if(catalog != null){ 
	%>
			
			<h2 class="title">Catalogo	<a href="catalogo.jsp" class="btn btn-primary">Mostra tutti</a></h2>
			<div class="container">
				<div class="row ">
					<% 
					for(int i = 0; i < catalog.size(); i++){
					%> 
					<div class="col-lg-3 col-md-6 col-sm-6 my-2" id="movie<%=catalog.get(i).getId()%>">
					  <img class="card-img-top img-fluid rounded" height="400" src="<%= catalog.get(i).getImgpath() %>" alt="Card image cap">
					  <div class="card-body">
					    <h5 class="card-title"><a href="movieinfo.jsp?movie=<%=catalog.get(i).getId()%>"><%= catalog.get(i).getTitle() %></a></h5>
					    <p class="card-text"><%= catalog.get(i).getDescriptionAbbv()%></p>
					    <div class="row">
					    	<a class="input-group-text float-right" id="basic-addon2 inputGroup-sizing-sm"><%= catalog.get(i).getPrice()%>EUR</a>
					    	<a href="AddCart?mov=<%=catalog.get(i).getId()%>" class="btn btn-primary float-left"><i class="fas fa-cart-plus"></i></a>
					    </div>
					  </div>
					</div>
					<%
					}
					%>
				</div>
			</div>	
		<div class="row">
		
		</div>
		<%
		}
		%>
	</div>
	
</body>
</html>