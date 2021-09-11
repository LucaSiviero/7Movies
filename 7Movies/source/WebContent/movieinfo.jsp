<%@page import="model.MovieBeanDAO"%>
<%@page import="model.MovieBean"%>
<%@page import="model.ReviewBean"%>
<%@page import="model.ReviewBeanDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./fragments/header.jsp"%>
<% 
	String id = request.getParameter("movie"); 
	MovieBean mov = MovieBeanDAO.getMovieById(id);
	if(mov == null){%>
		<meta http-equiv="refresh" content="0;URL=redirect.jsp?act=generr">
	<% 
	}else{
	%>
	<title>7movies - <%= mov.getTitle() %></title>
</head>
<body>
	<section class="container my-5">
		<h1 class="title" id="movie<%=mov.getId()%>"><%=mov.getTitle()%></h1>
		<section class="row col-lg-10 col-md-12">
			<div class="col-lg-4 col-md-8 col-sm-8 my-2" >
				<img class="card-img-top img-fluid rounded-bottom" src="<%= mov.getImgpath() %>" alt="Card image">
			</div>
			<div class="col-lg-8 col-md-12">
				<blockquote class="my-3 ml-4 blockquote text-left">
				  <p class="mb-0"><%=mov.getDescription()%></p>
				  <p class=" mt-4 ">Regista: <%=mov.getDirector()%> <br/>Anno: <%=mov.getYear()%> <br/> Disponibile in <%=mov.getLangs()%></p>
				</blockquote>
				<a class="input-group-text float-left ml-4" id="basic-addon2 inputGroup-sizing-sm"><%= mov.getPrice()%>EUR</a>
				<a href="AddCart?mov=<%=mov.getId()%>" class="btn btn-primary text-left"><i class="fas fa-cart-plus"></i></a>
					    <% if(admin.booleanValue()){ %>
							<a href="modmovie.jsp?mov=<%=mov.getId()%>" class="btn btn-primary text-left mx-2"><i class="fas fa-edit"></i></a>
						<%}%>
			</div>
		</section>
		<h3 class="title mt-5 ">Recensioni:</h3>
		<% 
		ArrayList<ReviewBean> revs = new ArrayList<ReviewBean>();
		revs = ReviewBeanDAO.getRevs(mov.getId());
		if(revs.size() != 0){
			for(ReviewBean rev : revs){ %>
			<section class="row mx-4 rounded col-8 border my-4">
				<h5 class="mb-2 mt-4 px-3 col-12"><%= rev.getName() %>: <%= rev.getTitle() %></h5>
				<p class="px-4 mb-2 col-12 "><%= rev.getReview() %></p>
				<p class="blockquote-footer text-right col-11 mb-4"><%= rev.getName() %>, in data <%= rev.getDate()%></p>
			</section>
		<%
			} 
		}else{ 
		%>
			<p class="mx-4 mb-5">Nessuno ha ancora recensito <%=mov.getTitle() %></p>
		<%
		}if(log.booleanValue()){%>
		<h3 class="title mt-5 ">Lascia una recensione:</h3>
			<form class="mx-4 col-8" action="ReviewMovie" method="post">
			  <div class="form-group">
			    <label for="formGroupExampleInput">Titolo</label>
			    <input name="title" type="text" class="form-control" id="formGroupExampleInput" maxlength="50" required>
			  </div>
			  <div class="form-group">
			    <label for="exampleFormControlTextarea1">Recensione:</label>
			    <textarea name="rev" class="form-control" id="exampleFormControlTextarea1" rows="3" maxlength="1000" required></textarea>
			  </div>
			  <input type="hidden" name="id" value="<%= mov.getId() %>" required>
			  <button type="submit" class="btn btn-primary">Invia</button>
			</form>
		<%}%>
	</section>
<% } %>
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