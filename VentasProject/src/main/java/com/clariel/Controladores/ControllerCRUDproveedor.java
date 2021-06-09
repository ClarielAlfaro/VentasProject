package com.clariel.Controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.clariel.DAO.ClsProveedor;
import com.clariel.entidades.Proveedor;
import com.google.gson.Gson;

/**
 * Servlet implementation class ControllerCRUDproveedor
 */
public class ControllerCRUDproveedor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerCRUDproveedor() {
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
		String IdProveedor = request.getParameter("IdProveedor");		
		String Nombre = request.getParameter("Proveedor");		
		String Direccion = request.getParameter("Direccion");
		String Telefono = request.getParameter("Telefono");		
		//Esto viene del jsp CRUD_CLIENTES
		
		ClsProveedor clspro = new ClsProveedor();
		Proveedor pro = new Proveedor();
		
		if(evaluar!=null) {
			
			if(evaluar.equals("btne")) {				
				
				pro.setIdProveedor(Integer.parseInt(IdProveedor));
				clspro.Eliminar(pro);
				response.sendRedirect("Listadoproveedores.jsp");
			}
			
		} else if(agregando.equals("btna")) {
			
			pro.setNombreProveedor(Nombre);			
			pro.setDireccion(Direccion);
			pro.setTelefono(Telefono);			
		
			//System.out.println(IdCliente);
			
			if(IdProveedor=="" ||IdProveedor==null) {				
				clspro.Guardar(pro);
				response.sendRedirect("Listadoproveedores.jsp");
			}
			else {
				pro.setIdProveedor(Integer.parseInt(IdProveedor));
				clspro.Actualizar(pro);
				response.sendRedirect("Listadoproveedores.jsp");
			}
			
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		Gson json = new Gson();

		ClsProveedor clsPro = new ClsProveedor();
		response.getWriter().append(json.toJson(clsPro.ListadoProveedores()));
		
	}

}
