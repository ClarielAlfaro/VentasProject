package com.clariel.Controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.clariel.DAO.ClsProducto;
import com.clariel.entidades.Producto;
import com.google.gson.Gson;

/**
 * Servlet implementation class ControllerCRUDinventario
 */
public class ControllerCRUDinventario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerCRUDinventario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String evaluar = request.getParameter("Eliminar");
		
		
		String agregando = request.getParameter("Guardar");
		String IdProducto = request.getParameter("IdProducto");		
		String IdCategoria = request.getParameter("CATEGORIA");
		String IdProveedor = request.getParameter("PROVEEDOR");
		String Nombre = request.getParameter("Producto");
		String Cantidad = request.getParameter("Cantidad");
		String Costo = request.getParameter("Costo");	
		String Precio = request.getParameter("Precio");	
		//Esto viene del jsp CRUD_CLIENTES
		
		//String combo = request.getParameter("usuario");
		System.out.println(IdCategoria);
		
		ClsProducto clsEmp = new ClsProducto();
		Producto pro = new Producto();
		
		if(evaluar!=null) {
			
			if(evaluar.equals("btne")) {				
				
				pro.setIdProducto(Integer.parseInt(IdProducto));
				clsEmp.Eliminar(pro);
				response.sendRedirect("Inventario.jsp");
			}
			
		} else if(agregando.equals("btna")) {
			
			pro.setIdCategoria(Integer.parseInt(IdCategoria));
			pro.setIdProducto(Integer.parseInt(IdProveedor));
			pro.setNombre_Producto(Nombre);
			pro.setCantidad(Integer.parseInt(Cantidad));
			pro.setCosto(Double.parseDouble(Costo));
			pro.setPrecio(Double.parseDouble(Precio));
		
			//System.out.println(IdCliente);
			
			if(IdProducto=="" ||IdProducto==null) {				
				clsEmp.Guardar(pro);
				response.sendRedirect("Inventario.jsp");
			}
			else {
				pro.setIdProducto(Integer.parseInt(IdProducto));
				clsEmp.Actualizar(pro);
				response.sendRedirect("Inventario.jsp");
			}
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		//String combo = request.getParameter("usuario");
		//System.out.println(combo);
		
		Gson json = new Gson();

		ClsProducto clsProd = new ClsProducto();
		response.getWriter().append(json.toJson(clsProd.ListadoProductos()));
		
	}

}
