package com.clariel.Controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.clariel.DAO.ClsCategoria;
import com.clariel.entidades.Categoria;
import com.google.gson.Gson;

/**
 * Servlet implementation class ControllerCRUDcategoria
 */
public class ControllerCRUDcategoria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerCRUDcategoria() {
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
		String IdCategoria = request.getParameter("IdCategoria");		
		String Nombre = request.getParameter("Categoria");		
		//Esto viene del jsp CRUD_CLIENTES
		
		ClsCategoria clscate = new ClsCategoria();
		Categoria cat = new Categoria();
		
		if(evaluar!=null) {
			
			if(evaluar.equals("btne")) {				
				
				cat.setIdCategoria(Integer.parseInt(IdCategoria));
				clscate.Eliminar(cat);
				response.sendRedirect("ListaCategoria.jsp");
			}
			
		} else if(agregando.equals("btna")) {
			
			cat.setNombreCategoria(Nombre);
			
		
			//System.out.println(IdCliente);
			
			if(IdCategoria=="" ||IdCategoria==null) {				
				clscate.Guardar(cat);
				response.sendRedirect("ListaCategoria.jsp");
			}
			else {
				cat.setIdCategoria(Integer.parseInt(IdCategoria));
				clscate.Actualizar(cat);
				response.sendRedirect("ListaCategoria.jsp");
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

		ClsCategoria clsCat = new ClsCategoria();
		response.getWriter().append(json.toJson(clsCat.ListadoCategorias()));
		
	}

}
