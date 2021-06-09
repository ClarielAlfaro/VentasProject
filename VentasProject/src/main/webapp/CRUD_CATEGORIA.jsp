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
String Id= request.getParameter("Id");
String Nombre= request.getParameter("Nombre");

if (Id==null){
	
	Id = "";
	Nombre = "";
}
%>


<form action="ControllerCRUDcategoria" method="get">

<input type="hidden" value=<%=Id%> name="IdCategoria"  >

<label>Nombre</label>
<input type="text" value="<%=Nombre%>" name="Categoria">

<button name="Guardar" value="btna">Guardar</button>

</form>


</body>
</html>