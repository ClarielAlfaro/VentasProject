package com.clariel.Controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.clariel.DAO.ClsEmpleado;
import com.clariel.entidades.Empleado;
import com.google.gson.Gson;

/**
 * Servlet implementation class ControllerCRUDempleado
 */
public class ControllerCRUDempleado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerCRUDempleado() {
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
		String IdEmpleado = request.getParameter("IdEmpleado");		
		String IdCargo = request.getParameter("IdC");
		String Nombre = request.getParameter("Empleado");
		String Apellido = request.getParameter("Apellido");
		String Usuario = request.getParameter("Usuario");
		String Contrasenia = request.getParameter("Contrasenia");		
		//Esto viene del jsp CRUD_CLIENTES
		
		ClsEmpleado clsEmp = new ClsEmpleado();
		Empleado Emp = new Empleado();
		
		if(evaluar!=null) {
			
			if(evaluar.equals("btne")) {				
				
				Emp.setIdEmpledo(Integer.parseInt(IdEmpleado));
				clsEmp.Eliminar(Emp);
				response.sendRedirect("ListaEmpleado.jsp");
			}
			
		} else if(agregando.equals("btna")) {
			
			Emp.setIdCargo(Integer.parseInt(IdCargo));
			Emp.setNombreEmpleado(Nombre);
			Emp.setApellidoEmpleado(Apellido);
			Emp.setUsuario(Usuario);
			Emp.setContrasenia(Contrasenia);		
		
			//System.out.println(IdCliente);
			
			if(IdEmpleado=="" ||IdEmpleado==null) {				
				clsEmp.Guardar(Emp);
				response.sendRedirect("ListaEmpleado.jsp");
			}
			else {
				Emp.setIdEmpledo(Integer.parseInt(IdEmpleado));
				clsEmp.Actualizar(Emp);
				response.sendRedirect("ListaEmpleado.jsp");
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

		ClsEmpleado clsEmp = new ClsEmpleado();
		response.getWriter().append(json.toJson(clsEmp.ListadoEmpleados()));
		
	}

}
