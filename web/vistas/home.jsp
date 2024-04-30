<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../includes/header.jsp" />
<style>
    .consulta{
        padding: 30px;
    }
    

    tr, td, th{
        
        padding: 10px 30px;
    }

    th{
        border-bottom: 15px;
    }

    .tit{
        display: flex;
        gap:30px;
        flex-direction: column-reverse;
        justify-content: center;
        align-items: center;
        padding: 30px;

        a{
            border-bottom: 5px solid black;
            padding: 10px
        }
        
        

    }

    .links{
        display: flex;
        gap: 20px;

        a{
            font-size: 20px;
            font-weight: bold;
            text-transform: uppercase;
            -webkit-text-stroke-width: 1px; /* Ancho del contorno */
            -webkit-text-stroke-color: #696969;
        }
    }
    
    .adds:hover{
        font-size: 25px;
    }
</style>
<div class="consulta">
    <div class="tit">
        <h1>Lista de USUARIOS</h1>
        <h2><a class="adds" href='agregar.jsp'>Agregar USUARIO</a></h2>
    </div>
    <%
        Connection conexion = null;
        Statement s = null;
        ResultSet rs = null;

        try {
            // Obtenemos el driver para MySQL
            Class.forName("com.mysql.jdbc.Driver");
            // Se obtiene una conexión con la base de datos
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/bdexaasi_bernal", "root", "");
            // Permite ejecutar sentencias SQL sin parámetros
            s = conexion.createStatement();

            // Consulta SQL para seleccionar los datos de la tabla
            String query = "SELECT id, nombre, password, typeuser FROM usuariosasi_bernal";
            rs = s.executeQuery(query);

            // Mostrar los resultados en una tabla HTML
            out.println("<table border='1'>");
            out.println("<tr><th>Id</th><th>Nombre</th><th>Password</th><th>TypeUser</th><th>Acciones</th></tr>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("id") + "</td>");
                out.println("<td>" + rs.getString("nombre") + "</td>");
                out.println("<td>" + rs.getString("password") + "</td>");
                out.println("<td>" + rs.getDouble("typeuser") + "</td>");
                out.println("<td class='links'>");
                out.println("<a href='eliminarUsuario.jsp?id=" + rs.getInt("id") + "'>Eliminar</a>");
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        } catch (ClassNotFoundException e1) {
            // Error si no puedo leer el driver de MySQL
            out.println("ERROR: No encuentro el driver de la BD: " + e1.getMessage());
        } catch (SQLException e) {
            // Manejo de excepciones SQL
            out.println("ERROR: Problemas al conectar con la base de datos: " + e.getMessage());
        } finally {
            // Cerrar recursos
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ignore) {
                }
            }
            if (s != null) {
                try {
                    s.close();
                } catch (SQLException ignore) {
                }
            }
            if (conexion != null) {
                try {
                    conexion.close();
                } catch (SQLException ignore) {
                }
            }
        }
    %>
</div>

<jsp:include page="../includes/footer.jsp" />
