package com.clariel.Controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.clariel.DAO.Clscliente;
import com.clariel.entidades.Cliente;
import com.google.gson.Gson;

/**
 * Servlet implementation class ControllerMostrarProductos
 */
@WebServlet("/ControllerMostrarProductos")
public class ControllerMostrarProductos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerMostrarProductos() {
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
		String IdCliente = request.getParameter("IdCliente");		
		String Nombre = request.getParameter("Cliente");
		String Apellido = request.getParameter("Apellido");
		String Direccion = request.getParameter("Direccion");
		String Telefono = request.getParameter("Telefono");
		String DUI = request.getParameter("DUI");
		String NIT = request.getParameter("NIT");
		String NRC = request.getParameter("NRC");
		//Esto viene del jsp CRUD_CLIENTES
		
		Clscliente clsclie = new Clscliente();
		Cliente clien = new Cliente();
		
		if(evaluar!=null) {
			
			if(evaluar.equals("btne")) {				
				
				clien.setIdCliente(Integer.parseInt(IdCliente));
				clsclie.Eliminar(clien);
				response.sendRedirect("Principal.jsp");
			}
			
		} else if(agregando.equals("btna")) {
			
			clien.setNombreCliente(Nombre);
			clien.setApellidoCliente(Apellido);
			clien.setDireccion(Direccion);
			clien.setTelefono(Telefono);
			clien.setDui(DUI);
			clien.setNit(NIT);
			clien.setNrc(NRC);
		
			//System.out.println(IdCliente);
			
			if(IdCliente=="" ||IdCliente==null) {				
				clsclie.Guardar(clien);
				response.sendRedirect("Principal.jsp");
			}
			else {
				clien.setIdCliente(Integer.parseInt(IdCliente));
				clsclie.Actualizar(clien);
				response.sendRedirect("Principal.jsp");
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

		Clscliente clsClien = new Clscliente();
		response.getWriter().append(json.toJson(clsClien.ListadoClientes()));
	}

}
