<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eliminar Producto</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection conexion = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/bdexaasi_bernal", "root", "");
        String query = "DELETE FROM usuariosasi_bernal WHERE id = ?";
        pstmt = conexion.prepareStatement(query);
        pstmt.setInt(1, id);
        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected > 0) {
            out.println("Uusario eliminado exitosamente.");
            response.sendRedirect("home.jsp");
        } else {
            out.println("No se pudo eliminar el Uusuario.");
            response.sendRedirect("home.jsp");

        }
    } catch (Exception e) {
        out.println("Error al eliminar el Uusario " + e.getMessage());
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conexion != null) try { conexion.close(); } catch (SQLException ignore) {}
    }
%>
</body>
</html>
