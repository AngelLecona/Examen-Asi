<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../includes/header.jsp" />
<style>
    .todo{
        height: 400px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
</style>
<div class="todo">
    <div >
        <h1>Todos los USUARIOS</h1>
        <h2><a href='agregar.jsp'>Agregar</a></h2>
    </div>
    <%
        Connection conexion = null;
        Statement s = null;
        ResultSet rs = null;

        try {
            // Obtenemos el driver para MySQL
            Class.forName("com.mysql.jdbc.Driver");
            // Se obtiene una conexión con la base de datos
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/bdexaasi_lecona", "root", "");
            // Permite ejecutar sentencias SQL sin parámetros
            s = conexion.createStatement();

            // Consulta SQL para seleccionar los datos de la tabla
            String query = "SELECT id, nombre_usuario, contrasena, tipo_usuario FROM usuariosasi_lecona";
            rs = s.executeQuery(query);

            // Mostrar los resultados en una tabla HTML
            out.println("<table border='1'>");
            out.println("<tr><th>Id</th><th>Nombre</th><th>Contraseña</th><th>tipo usuario</th>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("id") + "</td>");
                out.println("<td>" + rs.getString("nombre_usuario") + "</td>");
                out.println("<td>" + rs.getString("contrasena") + "</td>");
                out.println("<td>" + rs.getInt("tipo_usuario") + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        } catch (ClassNotFoundException e1) {
            // Error si no puedo leer el driver de MySQL
            out.println("ERROR: No encuentro el driver de la BD: " + e1.getMessage());
        } catch (SQLException e) {
            // Manejo de excepciones SQL
            out.println("ERROR: Problemas al conectar con la base de datos: " + e.getMessage());
        } 
    %>
</div>

<jsp:include page="../includes/footer.jsp" />
