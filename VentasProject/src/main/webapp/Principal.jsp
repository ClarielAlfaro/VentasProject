<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<head>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

*{
padding:0;
margin:0;
box-sizing: border-box;
}

body{
background-image: url(C:\Users\alfar\Desktop\menu bar\background.jpg);
background-size: cover;
background-position: center;
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
<li><a href="Principal.jsp" class="btn btn-success">Buscar Cliente</a></li>
<li><a  href="CRUD_CLIENTES.jsp" class="btn btn-success">Agregar y Modificar</a></li>
</ul>
</div>
</li>
<li><a href="#"><i class="fa fa-user" aria-hidden="true"></i>Proveedores</a>
<div class="sub-menu-1">
<ul>
<li><a href="#"></a>Buscar Proveedores</li>
<li><a href="#"></a>Agregar y Modificar</li>
</ul>
</div>
</li>
<li><a href="#"><i class="fa fa-book" aria-hidden="true"></i>Productos</a>
<div class="sub-menu-1">
<ul>
<li><a href="#" ></a>Agregar y Modificar</li>
<li><a href="#"></a>Categorias</li>
</ul>
</div>
</li>
<li><a href="#"><i class="fa fa-book" aria-hidden="true"></i>Inventario</a>
<div class="sub-menu-1">
<ul>
<li><a href="#"></a>Visualizar</li>
</ul>
</div>
</li>
<li><a href="#"><i class="fa fa-user" aria-hidden="true"></i>Empleados</a>
<div class="sub-menu-1">
<ul>
<li><a href="#"></a>Buscar Empleados</li>
<li><a href="#"></a>Agregar y Modificar</li>
<li><a href="ListaCargos.jsp" class="btn btn-success">cargos</a></li>
<li><a href="CRUD_CARGOS.jsp" class="btn btn-success">Modificar cargos</a></li>
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

<table class="table table-success table-striped" id="tablaDatos">
<thead>

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