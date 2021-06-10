<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<style>

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

<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

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


<script type="text/javascript">

$(document).ready(function(){
	
	$.post('ControllerCRUDcategoria',{
		//Esta seccion es para enviar peticiones al servidor
		
	}, function(response){
		//Esta seccion es para recibir informacion
		
		let datos = JSON.parse(response);		
		console.log(datos);
		
		var combo = document.getElementById('Combo');
		
		for (let item of datos){
			
			combo.innerHTML += `
			
				<option value ="${item.idCategoria}">#${item.idCategoria}   ${item.nombre_categoria}</option>
			
			`
			
		}
		
	})
})


</script>

<script type="text/javascript">

$(document).ready(function(){
	
	$.post('ControllerCRUDproveedor',{
		//Esta seccion es para enviar peticiones al servidor
		
	}, function(response){
		//Esta seccion es para recibir informacion
		
		let datos = JSON.parse(response);		
		console.log(datos);
		
		var combo = document.getElementById('Combo2');
		
		for (let item of datos){
			
			combo.innerHTML += `
			
				<option value ="${item.idProveedor}">#${item.idProveedor}   ${item.nombre_proveedor}</option>
			
			`
			
		}
		
	})
})


</script>

<%
String Id= request.getParameter("Id");
String Nombre= request.getParameter("Nombre");
String Cantidad= request.getParameter("Cantidad");
String Costo= request.getParameter("Costo");
String Precio= request.getParameter("Precio");
String Categoria= request.getParameter("Categoria");
String Proveedor= request.getParameter("Proveedor");

if (Id==null){
	
	Id = "";
	Nombre = "";
	Cantidad = "";
	Costo = "";
	Precio = "";
	Categoria = "";
	Proveedor = "";
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




<form class ="box" action="ControllerCRUDinventario" method="get">

<input type="hidden" value=<%=Id%> name="IdProducto"  >

<p>Nombre:</p>
<input type="text" value="<%=Nombre%>" name="Producto" required ><br/>

<p>Cantidad:</p>
<input type="text" value="<%=Cantidad%>" name="Cantidad" required pattern="[0-9]+"><br/>

<p>Costo:</p>
<input type="text" value="<%=Costo%>" name="Costo" required pattern="[0-9]+"><br/>

<p>Precio:</p>
<input type="text" value="<%=Precio%>" name="Precio" required pattern="[0.0-9.9]+"><br/>
<br/>
<p># Categoria Actual:</p>
<input type="text" value="<%=Categoria%>" desabled><br/>
<br/>

<form action="ControllerCRUDcategoria" method="post">
<select class="" name="CATEGORIA" id="Combo" required>
<option value>Elige</option>
</select>
</form><br/>

<p># Proveedor Actual:</p>
<input type="text" value="<%=Proveedor%>" desabled><br/>
<br/>

<form action="ControllerCRUDproveedor" method="post">
<select class="" name="PROVEEDOR" id="Combo2" required>
<option value>Elige</option>
</select>
</form><br/>

<br/><button name="Guardar" value="btna" class="btn btn-success">Guardar</button>

</form>

</body>
</html>