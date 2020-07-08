<%-- 
    Document   : cursosllevando
    Created on : 15/06/2020, 11:47:17 AM
    Author     : MONARCA
--%>

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Personales</title>
        
        <%!
        String consulta;
        Connection cn;
        PreparedStatement pst;
        ResultSet rs ;
        %>
    <body>
        <h1>Registro Estudiante</h1> 
       
        <table border="1" cellspacing="0" celladding="" align="center">
            <thead>
                <tr>
                    <th>Código de estudiante</th>
                    <th >Nombres y Apellidos</th>
                    <th>Curso</th>
                    <th>TH</th>
                    <th>TC</th>
                </tr>
            </thead>

        <% 
        try {
        ConectaBd bd = new ConectaBd() ; 
        cn= bd.getConnection();
        consulta= " SELECT e.codigo , e.nombre, e.apellidos , c.nombre , c.horas , c.creditos "
                + " FROM estudiante e, curso c, estudiante_curso ec "
                + " WHERE e.idestudiante = ec.id_estudiante and "
                + " c.idcurso = ec.id_curso "  ;
            
      // out.println(consulta);
        pst = cn.prepareStatement(consulta);
        //rs es una lista (arreglo)
        rs = pst.executeQuery() ; 
        while (rs.next()) {  
            %>
            
            
            <tbody>
                <tr>
                   <td><% out.print(rs.getString(1)); %></td>
                   <td ><% out.print(rs.getString(2) ); %>
                   <% out.print(rs.getString(3)); %></td>
                   <td><% out.print(rs.getString(4)); %></td>
                   <td><% out.print(rs.getString(5)); %></td>
                   <td><% out.print(rs.getString(6)); %></td>
      
                </tr>
      
            
            <%
                     
            }
        }catch (Exception e){
            out.print("Error SQL");}
        %>
        </tbody>
             </table>
    </body>
</html>
