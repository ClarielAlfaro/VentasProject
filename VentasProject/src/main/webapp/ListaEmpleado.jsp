<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">

$(document).ready(function(){
	
	$.post('ControllerCRUDempleado',{
		//Esta seccion es para enviar peticiones al servidor
		
	}, function(response){
		//Esta seccion es para recibir informacion
		
		let datos = JSON.parse(response);		
		console.log(datos);
		
		var tabla = document.getElementById('tablaDatos');
		
		for (let item of datos){
			
			tabla.innerHTML += `
			
			<tr>
				<td>${item.idEmpleado}</td>			
				<td>${item.id_cargo}</td>		
				<td>${item.nombre_empleado}</td>				
				<td>${item.apellido_empleado}</td>
				<td>${item.usuario}</td>
				<td>${item.contrasenia}</td>					
				<td> <a href="ControllerCRUDempleado?IdEmpleado=${item.idEmpleado}&Eliminar=btne" class="btn btn-danger">ELIMINAR <a>
				<a href="CRUD_EMPLEADO.jsp?IdEmpleado=${item.idEmpleado}&Id=${item.id_cargo}&Nombre=${item.nombre_empleado}&Apellido=${item.apellido_empleado}&Usuario=${item.usuario}&Contrasenia=${item.contrasenia}" class="btn btn-warning">EDITAR <a>
				</td>
				
			</tr>
			
			`
		
		}
		
	})
})


</script>

<%
HttpSession sesion = (HttpSession) request.getSession();
String usuSession = String.valueOf(sesion.getAttribute("Usuario"));

System.out.println(usuSession + "Nombre de Usuario");

if(usuSession.equals(null) || usuSession.equals("null") ){
	
	response.sendRedirect("Index.jsp");
}

%>

<form action="ControllerAcceso" method="post">

<input type="submit" name="btncerrar" value="cerrar">

</form>

<table class="table table-success table-striped" id="tablaDatos">
<thead>

<th>ID EMPLEADO</th>
<th>ID CARGO</th>
<th>NOMBRE</th>
<th>APELLIDO</th>
<th>USUARIO</th>
<th>CONTRASENIA</th>
<th>ACCION</th>
</thead>
<tbody>



</tbody>

</table>



</body>
</html>