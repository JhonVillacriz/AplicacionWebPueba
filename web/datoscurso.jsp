<%-- 
    Document   : datoscurso
    Created on : 15/06/2020, 11:42:53 AM
    Author     : MONARCA
--%>

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Curso</title>
        
        <%!
        String consulta;
        Connection cn;
        PreparedStatement pst;
        ResultSet rs ; %>
    <body>
        <h1>Datos Estudiante</h1> 
       
        <table border="1" cellspacing="0" celladding="" align="center">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Código</th>
                    <th>Curso</th>
                    <th>TH</th>
                    <th>TC</th>
                    <th>Estado</th>
                </tr>
            </thead>
        <% 
        //ecepcion
        try {
        ConectaBd bd = new ConectaBd() ; 
        cn= bd.getConnection();
        consulta= " Select idcurso , codigo , nombre ,horas,creditos,estado "
        + " from curso " ;
      // out.println(consulta);
        pst = cn.prepareStatement(consulta);
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
                </tr>

            <%                    
            }
        }catch (Exception e){
            out.print("Error SQL"); }
        %>
        </tbody>
             </table>
    </body>
</html>
