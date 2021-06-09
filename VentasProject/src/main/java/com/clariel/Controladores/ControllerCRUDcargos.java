package com.clariel.Controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.clariel.DAO.ClsCargo;
import com.clariel.entidades.Cargo;
import com.google.gson.Gson;

/**
 * Servlet implementation class ControllerCRUDcargos
 */
public class ControllerCRUDcargos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerCRUDcargos() {
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
		String IdCargo = request.getParameter("IdCargo");		
		String Cargo = request.getParameter("Cargo");
		double Sueldo = Double.parseDouble(request.getParameter("Sueldo")) ;		
		//Esto viene del jsp CRUD_CLIENTES
		
		ClsCargo clscargo = new ClsCargo();
		Cargo cargo = new Cargo();
		
		if(evaluar!=null) {
			
			if(evaluar.equals("btne")) {				
				
				cargo.setIdCargo(Integer.parseInt(IdCargo));
				clscargo.Eliminar(cargo);
				response.sendRedirect("ListaCargos.jsp");
			}
			
		} else if(agregando.equals("btna")) {
			
			cargo.setNombreCargo(Cargo);
			cargo.setSueldo(Sueldo);		
		
			//System.out.println(IdCliente);
			
			if(IdCargo=="" ||IdCargo==null) {				
				clscargo.Guardar(cargo);
				response.sendRedirect("ListaCargos.jsp");
			}
			else {
				cargo.setIdCargo(Integer.parseInt(IdCargo));
				clscargo.Actualizar(cargo);
				response.sendRedirect("ListaCargos.jsp");
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

		ClsCargo clscargo = new ClsCargo();
		response.getWriter().append(json.toJson(clscargo.ListadoCargos()));
		
	}

}
