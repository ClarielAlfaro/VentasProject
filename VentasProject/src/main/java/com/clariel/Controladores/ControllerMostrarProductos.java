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
		
		Clscliente clsclie = new Clscliente();
		
		Cliente clien = new Cliente();
		
		clien.setIdCliente(Integer.parseInt(request.getParameter("clien")));
		clsclie.Eliminar(clien);
		response.sendRedirect("Principal.jsp");
		
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
