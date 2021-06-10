package com.clariel.Controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.clariel.DAO.ClsEmpleado;


/**
 * Servlet implementation class ControllerAcceso
 */
@WebServlet("/ControllerAcceso")
public class ControllerAcceso extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAcceso() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		HttpSession session = request.getSession(true);
		
		String btncerrar = request.getParameter("btncerrar");
		
		if(btncerrar!=null) {
			
			response.sendRedirect("Index.jsp");
			session.invalidate();
			
		}else {		
		
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		
		//Empleado log = new Empleado();
		ClsEmpleado clsEm = new ClsEmpleado();
		
			
		var valordeacceso = clsEm.LoguinUsuario(user,pass);
		
		
		if(valordeacceso == 1) {
			System.out.println("WELCOME");
			response.sendRedirect("Principal.jsp");
			session.setAttribute("Usuario",valordeacceso);
		}
		else if (valordeacceso == 0){
			System.out.println("El usuario no existe");
			response.sendRedirect("Index.jsp");
		}
		else {
			System.out.println("ERROR");
			response.sendRedirect("Error.jsp");
		}
		
	}

}

}
