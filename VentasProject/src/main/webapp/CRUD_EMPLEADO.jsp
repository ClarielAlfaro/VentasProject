<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<head>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String Id= request.getParameter("IdEmpleado");
String IdC= request.getParameter("Id");
String Nombre= request.getParameter("Nombre");
String Apellido= request.getParameter("Apellido");
String Usuario= request.getParameter("Usuario");
String Contrasenia= request.getParameter("Contrasenia");

if (Id==null){
	
	Id = "";
	IdC = "";
	Nombre = "";
	Apellido = "";
	Usuario = "";
	Contrasenia = "";	
}
%>


<form action="ControllerCRUDempleado" method="get">

<input type="hidden" value=<%=Id%> name="IdEmpleado"  >

<label>Id Cargo</label>
<input type="text" value="<%=IdC%>" name="IdC">

<label>Nombre</label>
<input type="text" value="<%=Nombre%>" name="Empleado">

<label>Apellido</label>
<input type="text" value="<%=Apellido%>" name="Apellido">

<label>Usuario</label>
<input type="text" value="<%=Usuario%>" name="Usuario">

<label>Contrasenia</label>
<input type="text" value="<%=Contrasenia%>" name="Contrasenia">

<button name="Guardar" value="btna">Guardar</button>

</form>


</body>
</html>