<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%! @SuppressWarnings("unchecked") %>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="model.MovieBean"%>
<%@page import="model.MovieBeanDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.UserBean"%>

<%
	HttpSession s = request.getSession();
	ArrayList<MovieBean> cart = (ArrayList<MovieBean>) session.getAttribute("cart");
	UserBean ub = (UserBean) s.getAttribute("user");
	Boolean log = false;
	Boolean admin = false;
	if(ub == null){
		System.out.println("no user logged");
		ub = new UserBean();
		session.setAttribute("isLogged", false);
		if(cart == null){
			cart = new ArrayList<MovieBean>();
			session.setAttribute("cart", cart);
		}
	}
	log = (Boolean) session.getAttribute("isLogged");
	if(log.booleanValue()){
		admin = ub.getAdmin();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
	
	<link rel="stylesheet" href="./style/main.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
</head>
<body>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<a class="navbar-brand" href="index.jsp">
    		<img class="img-fluid" src="img/logo - large.svg" alt="7movies" width="50" height="50">
  		</a>
  		<button class="navbar-toggler my-4" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon h1"></span>
  		</button>
  		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
		      <li class="nav-item">
		        <a class="nav-link" href="catalogo.jsp">Catalogo</a>
		      </li>
		      </ul> 
		    <form class="form-inline my-2 my-lg-0" method="get" action="Search" >
			     <input class="form-control mr-sm-2 border-0" type="search" placeholder="Search" aria-label="Search" name="word">
			     <button class="btn my-2 my-sm-0" type="submit">Cerca</button>
			</form>
			<ul class="navbar-nav mt-2 mt-lg-0">
			
			<% if(log.booleanValue()){ %>
		      <li class="nav-item">
		        <a class="nav-link" href="redirect.jsp?act=signout"><i class="fas fa-sign-out-alt"></i></a>
		      </li>
		      <% }else{ %>
		      <li class="nav-item">
		        <a class="nav-link" href="login.jsp">Login</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="signup.jsp">Signup</a>
		      </li>
		      <% } %>
		      <li class="nav-item">
		       <a class="nav-link" href="cart.jsp"><i class="fas fa-shopping-cart"></i></a>
		    </li>
		    </ul>
		  </div>
	</nav>
		
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
</body>
</html>