<%-- 
    Document   : datosestudiante
    Created on : 15/06/2020, 09:19:02 AM
    Author     : MONARCA
--%>
<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Estudiante</title>
        
        <%!
        String consulta;
        Connection cn;
        PreparedStatement pst;
        ResultSet rs ;
        String s_accion ;
        String s_idalumno;     
        %>
    <body>
        <h1>Datos Estudiante</h1> 
       
        <table border="1" cellspacing="0" celladding="" align="center">
            <thead>
                <tr>
                    <th colspan="8">Datos Estudiante</th>
                </tr>
                <tr>
                    <th>ID</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>DNI</th>
                    <th>Código</th>
                    <th>Estado</th>
                    <th>Eleminar</th>
                    <th>Editar</th>
                </tr>
            </thead>
            
            
       

        
        <% 
        //ecepcion
        try {
        ConectaBd bd = new ConectaBd() ; 
        cn= bd.getConnection();
        consulta= " Select idestudiante , nombre ,apellidos,dni,codigo,estado "
        + " from estudiante " ;
          //consulta= " Select idestudiante, nombre, apellidos, dni, codigo, estado "
            //            + " from estudiante ";

      // out.println(consulta);
        pst = cn.prepareStatement(consulta);
        //rs es una lista (arreglo)
        rs = pst.executeQuery() ; 
        while (rs.next()) {  
            %>
            
            
            <tbody>
                <tr>
                   <td><% out.print(rs.getString(1)); %></td>
                   <td><% out.print(rs.getString(2)); %></td>
                   <td><% out.print(rs.getString(3)); %></td>
                   <td><% out.print(rs.getString(4)); %></td>
                   <td><% out.print(rs.getString(5)); %></td>
                   <td><% out.print(rs.getString(6)); %></td>
                   <td>Eliminar</td>
                   <td>Editar</td>
                   
                </tr>
      
            
            <%
                     
            }
        }catch (Exception e){
            out.print("Error SQL");
            
            
        }
        %>
        </tbody>
             </table>
    </body>
</html>
