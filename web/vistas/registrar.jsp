<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String typeuser = "5"; // Supongo que el tipo de usuario es "user" por defecto

    Connection conexion = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/bdexaasi_bernal", "root", "");
        
        // Preparar la consulta SQL para insertar un nuevo usuario
        String query = "INSERT INTO usuariosasi_bernal (nombre, password, typeuser) VALUES (?, ?, ?)";
        pstmt = conexion.prepareStatement(query);
        
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        pstmt.setString(3, typeuser);
        
        // Ejecutar la consulta de inserción
        pstmt.executeUpdate();

        // Redireccionar al usuario a una página de inicio
        response.sendRedirect("login.jsp");
    } catch (Exception e) {
        out.println("Error al registrar el usuario: " + e.getMessage());
    } finally {
        // Cerrar los recursos
        if (pstmt != null) {
            try {
                pstmt.close();
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
