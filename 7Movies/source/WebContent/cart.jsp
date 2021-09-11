<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>7movies - Carrello</title>
</head>
<body>
	<%@include file="./fragments/header.jsp"%>
	<section class="container my-5">
	<h1 class="title mb-3">Carrello</h1>
	<%	if(cart.size() == 0){ %>
		<p>Il tuo carrello è ancora vuoto.</p>
	<%
		}else{
		for(MovieBean mb : cart){
	%>
			<div class="rounded border col-12 row my-2">			
				<div class="col-lg-1 col-md-2 col-sm-2 col-xs-2 my-2" >
					<img class="card-img-top img-fluid rounded-bottom" src="<%= mb.getImgpath() %>" alt="Card image">
				</div>
				<div class="row col-lg-11 col-md-10 ">
					<h5 class="mt-3 mb-2 col-lg-11"> <%= mb.getTitle() %></h5>
					<p class="mt-3 mb-2 col-1"><%=mb.getPrice() %>EUR</p>
					<p class="col-11"><%= mb.getDirector() %>, <%= mb.getYear() %></p> 
					<p class="col-1 text-right">
						<a class="btn btn-primary" href="RemoveCart?mov=<%=mb.getId()%>"><i class="fas fa-times"></i></a>
					</p>
				</div>
			</div>
			
	<%}%>
	
	<p><strong>Totale: <%= MovieBean.getTotal(cart)%> EUR</strong></p>
	
	<%	}
		if(cart.size() != 0 && !log.booleanValue()){
	%>
		<p class=" mt-5 text-right">Sembra che tu non abbia effettuato l'accesso. <br/><a href="signup.jsp">Registrati</a> oppure effettua il <a href="login.jsp">login</a> per completare l'acquisto.</p>
	<% }if(cart.size() != 0 && log.booleanValue()){ %>
			<a href="checkout.jsp" class="btn btn-primary float-right mr-5 mt-3 mb-5 p-2">Paga ora <i class="fab fa-paypal"></i></a>
	<% } %>	
	</section>
</body>
</html>