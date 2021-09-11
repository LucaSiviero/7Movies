<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="javax.servlet.http.HttpSession"%>
<%@page import="model.UserBean"%>
<%@page import="model.MovieBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
	
	<link rel="stylesheet" href="./style/main.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
	<meta charset="ISO-8859-1">
	<title>Stai per essere reindirizzato</title>
	<%
		HttpSession s = request.getSession();
		UserBean ub = (UserBean) s.getAttribute("user");
		Boolean log = false;
		if(ub == null){
			ub = new UserBean();
			session.setAttribute("isLogged", false);
		}else{
			log = (Boolean) session.getAttribute("isLogged");
		}
		String action = request.getParameter("act");
		String res = request.getParameter("res");
		if(action != null){
		if(action.equals("signup")){%>
			<meta http-equiv="refresh" content="2;URL=index.jsp">
			<div class="container justify-content-center mt-5">
			<h2 class="title mt-5 text-center">7movies</h2> 
			<p class="mb-5 text-center"> Registrazione avvenuta con successo, sarai reindirizzato alla home... </p>
		<%}if(action.equals("signout")){
			UserBean emptyuser = new UserBean();
			s.setAttribute("user", emptyuser);
			s.setAttribute("cart", new ArrayList<MovieBean>());
			s.setAttribute("isLogged", false);
	%>
			<meta http-equiv="refresh" content="1;URL=index.jsp">
			<div class="container justify-content-center mt-5">
			<h2 class="title mt-5 text-center">7movies</h2> 
			<p class="mb-5 text-center"> Byebye , sarai reindirizzato alla home... </p>
		</div>
	<%	}else if(action.equals("login")){
	%>
		<meta http-equiv="refresh" content="1;URL=index.jsp">
		<div class="container justify-content-center mt-5">
			<h2 class="title mt-5 text-center">7movies</h2> 
			<p class="mb-5 text-center"> Benvenuto, sarai reindirizzato alla home... </p>
		</div>
	<%}if(action.equals("adm") && (res == null || res.equals("0"))){%>
		<meta http-equiv="refresh" content="3;URL=catalogo.jsp">
		<div class="container justify-content-center mt-5">
			<h2 class="title mt-5 text-center">7movies <br/> </h2>
			<p class="mb-5 text-center"> Impossibile completare l'operazione, riprova più tardi.<br/> Sarai reindirizzato al catalogo... </p>
		</div>
	<%
		}else if(action.equals("adm") && res.equals("1")){%>
		<meta http-equiv="refresh" content="1;URL=catalogo.jsp">
		<div class="container justify-content-center mt-5">
			<h2 class="title mt-5 text-center">7movies <br/> </h2>
			<p class="mb-5 text-center"> Operazione completata correttamente. <br/> Sarai reindirizzato al catalogo... </p>
		</div>
	<%
		}else if(action.equals("generr")){%>
		<meta http-equiv="refresh" content="1;URL=catalogo.jsp">
		<div class="container justify-content-center mt-5">
			<h2 class="title mt-5 text-center">7movies <br/> </h2>
			<p class="mb-5 text-center"> Ops... Qualcosa è andato storto :( <br/> Sarai reindirizzato al catalogo... </p>
		</div>
	<%
		}else if(action.equals("buy") && (res == null || res.equals("0"))){
			%>
			<meta http-equiv="refresh" content="1;URL=index.jsp">
			<div class="container justify-content-center mt-5">
				<h2 class="title mt-5 text-center">7movies</h2> 
				<p class="mb-5 text-center"> Impossibile completare l'acquisto, sarai reindirizzato alla home... </p>
			</div>
		<%}else if(action.equals("buy") && res.equals("1")){
			ArrayList<MovieBean> cart = new ArrayList<MovieBean>();
			s.setAttribute("cart", cart);
			%>
			<meta http-equiv="refresh" content="1;URL=index.jsp">
			<div class="container justify-content-center mt-5">
				<h2 class="title mt-5 text-center">7movies</h2> 
				<p class="mb-5 text-center"> Acquisto completato con successo, sarai reindirizzato alla home...  </p>
			</div>
		<%}
	}
	%>
		
</head>
<body>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>