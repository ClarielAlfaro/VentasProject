<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">

$(document).ready(function(){
	
	$.post('ControllerMostrarProductos',{
		//Esta seccion es para enviar peticiones al servidor
		
	}, function(response){
		//Esta seccion es para recibir informacion
		
		let datos = JSON.parse(response);		
		console.log(datos);
		
		var tabla = document.getElementById('tablaDatos');
		
		for (let item of datos){
			
			tabla.innerHTML += `
			
			<tr>
				<td>${item.idCliente}</td>}
				<td>${item.nombre_cliente}</td>}
				<td>${item.apellido_cliente}</td>
				<td>${item.direccion}</td>
				<td>${item.telefono}</td>
				<td>${item.dui}</td>
				<td>${item.nit}</td>
				<td>${item.nrc}</td>
				<td> <a href="ControllerMostrarProductos?clien=${item.idCliente}" class="btn btn-danger">ELIMINAR <a></td>
				
			</tr>
			
			`
			console.log(item.nombre_cliente);
		}
		
	})
})


</script>



<table class="table table-dark table-striped" id="tablaDatos">
<thead>
<th>ID</th>
<th>NOMBRES</th>
<th>APELLIDOS</th>
<th>DIRECCION</th>
<th>TELEFONO</th>
<th>DUI</th>
<th>NIT</th>
<th>NRC</th>
<th>ACCION</th>
</thead>
<tbody>



</tbody>

</table>


</body>
</html>