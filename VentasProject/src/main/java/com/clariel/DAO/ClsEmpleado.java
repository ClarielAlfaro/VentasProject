package com.clariel.DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.clariel.Conexion.ConexionBd;
import com.clariel.entidades.Empleado;

public class ClsEmpleado {
	
	ConexionBd conexion = new ConexionBd();
	Connection con = conexion.RetornarConexion();

	public ArrayList<Empleado> ListadoEmpleados() {
		ArrayList<Empleado> Lista = new ArrayList<>();

		try {

			CallableStatement consulta = con.prepareCall("call SP_S_Empleado()");
            ResultSet rs = consulta.executeQuery();
            while (rs.next()) {
            	Empleado cat = new Empleado();
                cat.setIdEmpledo(rs.getInt("idEmpleado"));
                cat.setIdCargo(rs.getInt("id_cargo"));
                cat.setNombreEmpleado(rs.getString("nombre_empleado"));
                cat.setApellidoEmpleado(rs.getString("apellido_empleado"));
                cat.setUsuario(rs.getString("usuario"));
                cat.setContrasenia(rs.getString("contrasenia"));               
                
                Lista.add(cat);
			}
		} catch (Exception e) {
			// JOptionPane.showMessageDialog(null, "Ha ocurrido un error en: \n\n\n\n" + e);
		}

		return Lista;
	}
	
	public boolean LoguinUsuario(String Usuario, String PASS){
        ArrayList <Empleado> ListaUsuarioPass = new ArrayList<>();
        
        try {
           
            CallableStatement Statement = con.prepareCall("call SP_S_LOGUEO(?,?)");
            Statement.setString("pusuario", Usuario);
            Statement.setString("pcontra", PASS);            
            ResultSet resultadoDeConsulta = Statement.executeQuery();
            
                    
                
                
            while (resultadoDeConsulta.next()){
                
                Empleado es = new Empleado();
                
                es.setUsuario(resultadoDeConsulta.getString("usuario"));
                es.setContrasenia(resultadoDeConsulta.getString("contrasenia"));                
                ListaUsuarioPass.add(es);
                
            } 
            
            String UsuarioBD = null;
            String ContraBD = null;
          
                for(var iterador : ListaUsuarioPass){
                    
                UsuarioBD = iterador.getUsuario();
                ContraBD = iterador.getContrasenia();
                
                                    
            }
                
                if (UsuarioBD.equals(Usuario) && ContraBD.equals(PASS)){
                    return true;
                }
                con.close();
           
       } catch (Exception e) {
    	   
           
            System.out.println("Error" + e);
       }
        
         return false;
    
    
} 
	
	public void Guardar (Empleado cat) {
		
		try {
			CallableStatement consulta = con.prepareCall("call SP_I_Empleado(?,?,?,?,?)");	
			consulta.setInt("pid_cargo", cat.getIdCargo());
			consulta.setString("pnombre_empleado", cat.getNombreEmpleado());
			consulta.setString("papellido_empleado", cat.getApellidoEmpleado());

			consulta.setString("pusuario", cat.getUsuario());
			consulta.setString("pcontrasenia", cat.getContrasenia());			
			consulta.executeQuery();
			System.out.println("Exito");
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	public void Eliminar(Empleado cat) {

		try {
			CallableStatement consulta = con.prepareCall("call SP_D_Empleado(?)");
			consulta.setInt("pid", cat.getIdEmpleado());
			consulta.executeQuery();
			System.out.println("Exito");
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void ActualizarUsuario(Empleado cat) {

		try {
			CallableStatement consulta = con.prepareCall("call SP_U_Empleado(?,?,?,?,?,?)");
			consulta.setInt("pid", cat.getIdEmpleado());
			consulta.setInt("pid_cargo", cat.getIdCargo());
			consulta.setString("pnombre_empleado", cat.getNombreEmpleado());
			consulta.setString("papellido_empleado", cat.getApellidoEmpleado());
			consulta.setString("pusuario", cat.getUsuario());
			consulta.setString("pcontrasenia", cat.getContrasenia());			
			consulta.executeQuery();
			System.out.println("Exito");
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}


}
