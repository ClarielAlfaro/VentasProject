<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
<title>Insert title here</title>
</head>
<body>

<div class="menu-bar">
<ul>
<li class="active"><a href="#"><i class="fa fa-home" aria-hidden="true"></i>  Clientes</a>
<div class="sub-menu-1">
<ul>
<li><a class=""></a>Buscar Cliente</li>
<li><a  href="CRUD_CLIENTES.jsp" class="btn btn-warning">Agregar y Modificar</a></li>
</ul>
</div>
</li>
<li><a href="#"><i class="fa fa-book" aria-hidden="true"></i>Proveedores</a>
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
<li><a href="#"><i class="fa fa-book" aria-hidden="true"></i>Empleados</a>
<div class="sub-menu-1">
<ul>
<li><a href="#"></a>Buscar Empleados</li>
<li><a href="#"></a>Agregar y Modificar</li>
<li><a href="#"></a>cargos</li>
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
</body>
</html>