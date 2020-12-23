<%-- 
    Document   : ListEmployes
    Created on : 16 déc. 2020, 14:00:52
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Affichages des employés :</h1>
        <%@page import="java.sql.*" %>
        <table width="100%" border="2">
            <tr>
                <th width="30%">Matricule</th>
                <th width="30%">Nom</th>
                <th width="30%">Prenom</th>
                <th width="30%">Service</th>
            </tr>
            <%
            try{
                Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/etablissement", "anas", "azerty");
                Statement stmt = conn.createStatement();
                String sql = "select * from employe";
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()){%>
                <tr>
                    <td><%= rs.getString("matricule")%></td>
                    <td><%= rs.getString("nom")%></td>
                    <td><%= rs.getString("prenom")%></td>
                    <td><%= rs.getString("service")%></td>
                </tr>
                <%
                }   
            %>    
        </table>
        <% if (stmt != null) {
                    stmt.close();
                }
                if (conn != null){
                    conn.close();
            }    
    }
        catch (Exception e){
            out.print(e);
        }
    %>
    </body>
</html>
