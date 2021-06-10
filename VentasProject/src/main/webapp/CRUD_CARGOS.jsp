<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body{
background-color:#b0e0e6; 
font-family: sans-serif;
}

form{
	background-color:white;
	border-radius: 3px;
	font-size:1.2em;
	color: black;
	padding: 10px;
	margin: 0 auto;
	width:300px;
	}

	.box{
	width:600px;
	padding: 40px;
	position: absolute;
	top:50%;
	left:50%;
	transform: translate(-50%,-50%);
	text-align: center;
	}

	.box input[type="text"]{
	width:500px;
	padding: 5px;
	}

	.box p{
	margin-left:-385px;
	}

</style>


<meta charset="ISO-8859-1">
<title>Insert title here</title>


</head>
<body>

<%
String Id= request.getParameter("Id");
String Nombre= request.getParameter("Nombre");
String Sueldo= request.getParameter("Sueldo");


if (Id==null){
	
	Id = "";
	Nombre = "";
	Sueldo = "";
}
%>

<%
HttpSession sesion = (HttpSession) request.getSession();
String usuSession = String.valueOf(sesion.getAttribute("Usuario"));

System.out.println(usuSession + "Nombre de Usuario");

if(usuSession.equals(null) || usuSession.equals("null") ){
	
	response.sendRedirect("Index.jsp");
}

%>

<form class ="box" action="ControllerCRUDcargos" method="get">

<input type="hidden" value=<%=Id%> name="IdCargo">

<p>Nombre:</p>
<input type="text" value="<%=Nombre%>" name="Cargo" required pattern="[a-zA-Z]+"><br/>

<p>Sueldo:</p>
<input type="text" value="<%=Sueldo%>" name="Sueldo"  required pattern="[0.0-9.0]+"><br/>

<br/>
<button name="Guardar" value="btna" class="btn btn-success">Guardar</button>

</form>



</body>
</html>