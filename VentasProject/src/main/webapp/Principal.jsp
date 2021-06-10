<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

form{
	
	border-radius: 3px;
	font-size:1.2em;
	color: black;
	padding: 10px;
	margin: 0 auto;
	width:300px;
	}

	.box{
	width:1380px;
	padding: 10px;
	position: left;
	top:60%;
	left:50%;	
	text-align: left;
	}

*{
padding:0;
margin:0;
box-sizing: border-box;
}

body{
background-color:#b0e0e6; 
font-family: sans-serif;
}

.menu-bar{
background: rgb(0,100,0);
text-align: center;
}

.menu-bar ul{
display:inline-flex;
list-style:none;
color: #fff;
}

.menu-bar ul li{
width:200px;
margin:15px;
padding:15px;
z-index:1;
}

.menu-bar ul li a{
text-decoration:none;
color: #fff;
}

.active, .menu-bar ul li:hover{
background: #2bab0d;
border-radious:3px;
}

.menu-bar .fa{
margin-right:5px;
}

.sub-menu-1{
display:none;
}

.menu-bar ul li:hover .sub-menu-1{
display:block;
position:absolute;
background: rgb(0,100,0);
margin-top:15px;
margin-left:-15px;
}

.menu-bar ul li:hover .sub-menu-1 ul{
display:block;
margin:10px;
}


</style>


<meta charset="ISO-8859-1">
<title>Clientes</title>
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
				<td>${item.nombre_cliente}</td>
				<td>${item.apellido_cliente}</td>
				<td>${item.direccion}</td>
				<td>${item.telefono}</td>
				<td>${item.dui}</td>
				<td>${item.nit}</td>
				<td>${item.nrc}</td>
				<td> <a href="ControllerMostrarProductos?IdCliente=${item.idCliente}&Eliminar=btne" class="btn btn-danger">ELIMINAR <a>
				<a href="CRUD_CLIENTES.jsp?Id=${item.idCliente}&Nombre=${item.nombre_cliente}&Apellido=${item.apellido_cliente}&Direccion=${item.direccion}&Telefono=${item.telefono}&DUI=${item.dui}&NIT=${item.nit}&NRC=${item.nrc}" class="btn btn-warning">EDITAR <a>
				</td>
				
			</tr>
			
			`
			console.log(item.nombre_cliente);
		}
		
	})
})


</script>



<div class="menu-bar">
<ul>
<li class="active"><a href="#"><i class="fa fa-user" aria-hidden="true"></i>  Clientes</a>
<div class="sub-menu-1">
<ul>
<li><a href="Principal.jsp" class="btn btn-success">Mostrar Clientes</a></li>
<li><a  href="CRUD_CLIENTES.jsp" class="btn btn-success">Agregar Clientes</a></li>
</ul> 
</div>
</li>
<li><a href="#"><i class="fa fa-user" aria-hidden="true"></i>Proveedores</a>
<div class="sub-menu-1">
<ul>
<li><a href="Listadoproveedores.jsp" class="btn btn-success">Mostrar Proveedores</a></li>
<li><a href="CRUD_PROVEEDORES.jsp" class="btn btn-success">Agregar Proveedores</a></li>
</ul>
</div>
</li>
<li><a href="#"><i class="fa fa-book" aria-hidden="true"></i>Productos</a>
<div class="sub-menu-1">
<ul>
<li><a href="CRUD_PRODUCTOS.jsp" class="btn btn-success">Agregar</a></li>
<li><a href="ListaCategoria.jsp" class="btn btn-success">Categorias</a></li>
<li><a href="CRUD_CATEGORIA.jsp" class="btn btn-success">Agregar Categorias</a></li>
</ul>
</div>
</li>
<li><a href="#"><i class="fa fa-book" aria-hidden="true"></i>Inventario</a>
<div class="sub-menu-1">
<ul>
<li><a href="Inventario.jsp" class="btn btn-success">Visualizar</a></li>
</ul>
</div>
</li>
<li><a href="#"><i class="fa fa-user" aria-hidden="true"></i>Empleados</a>
<div class="sub-menu-1">
<ul>
<li><a href="ListaEmpleado.jsp" class="btn btn-success">Mostrar Empleados</a></li>
<li><a href="CRUD_EMPLEADO.jsp" class="btn btn-success">Agregar Empleado</a></li>
<li><a href="ListaCargos.jsp" class="btn btn-success">cargos</a></li>
<li><a href="CRUD_CARGOS.jsp" class="btn btn-success">Agregar cargo</a></li>
</ul>
</div>
</li>
<li><a href="#"><i class="fa fa-book" aria-hidden="true"></i>Administracion</a>
<div class="sub-menu-1">
<ul>
<li><a href="#"></a>Vender</li>
</ul>
</div>
</li>
</ul>
</div>

<%
HttpSession sesion = (HttpSession) request.getSession();
String usuSession = String.valueOf(sesion.getAttribute("Usuario"));

System.out.println(usuSession + "Nombre de Usuario");

if(usuSession.equals(null) || usuSession.equals("null") ){
	
	response.sendRedirect("Index.jsp");
}

%>

<form class="box" action="ControllerAcceso" method="post">

<input type="submit" name="btncerrar" value="Cerrar Sesion" class="btn btn-primary">

</form>

<div class="container">

<table class="table table-success table-striped" id="tablaDatos">
<thead class="table-light">

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

</div>

</body>
</html>