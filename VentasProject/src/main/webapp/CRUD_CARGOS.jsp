<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<head>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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


<form action="ControllerCRUDcargos" method="get">

<input type="hidden" value=<%=Id%> name="IdCargo">

<label>Nombre</label>
<input type="text" value="<%=Nombre%>" name="Cargo">

<label>Sueldo</label>
<input type="text" value="<%=Sueldo%>" name="Sueldo">


<button name="Guardar" value="btna">Guardar</button>

</form>

</body>
</html>