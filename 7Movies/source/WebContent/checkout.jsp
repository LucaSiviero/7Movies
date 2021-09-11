<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>7movies - Checkout</title>
</head>
<body>
	<%@include file="./fragments/header.jsp"%>
	<% if(!log.booleanValue() || cart.size() == 0 ){%>
		</body>
		<head>
			<meta http-equiv="refresh" content="0;URL=index.jsp">
		</head>
	<%}%>
	<section class="container my-5">
			<h1 class="title">Conferma l'ordine e paga</h1>
			<p class="mx-3 mt-3"><strong>Il tuo ordine:</strong></p>
			<table>
			<% for(MovieBean mov : cart){ %>
			
				<tr>
					<td><span class="mx-3"> <%= mov.getTitle()%> </span></td>
					<td><span class="mx-3 text-right"> <%= mov.getPrice()%> </span></td>
				</tr>
			<% } %>
			</table>
			<p class="mx-3 mt-3"><strong>Totale: <%=MovieBean.getTotal(cart)%> EUR</strong></p>
			<section class="payment col-lg-4 col-md-8 my-3">
				<script src="https://www.paypal.com/sdk/js?client-id=sb"></script>
				<script>paypal.Buttons().render('.payment');</script>
			</section>
	</section>
	
	<%if(request.getParameter("err") != null){%>
				<script>
				$(window).ready(function(){ 	
					    $('.ValidationServer01').addClass("is-invalid");
					setInterval(function(){ 
					    $('.ValidationServer01').removeClass("is-invalid")
					  }, 4500);

					});
				</script>
	<%}%>
</body>
</html>