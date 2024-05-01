<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.math.BigInteger" %>



<%
    String nombre = request.getParameter("usuario");
    String contrasena = request.getParameter("contrasena");

    Connection conexion = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean accesoPermitido = false;
    String userType = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/bdexaasi_lecona", "root", "");
        
        // Encriptar la contraseña proporcionada con SHA
        MessageDigest sha = MessageDigest.getInstance("SHA");
        sha.update(contrasena.getBytes());
        byte[] bytes = sha.digest();
        BigInteger bi = new BigInteger(1, bytes);
        String hashPass = bi.toString(16);

        // Preparar la consulta SQL para buscar el usuario y la contraseña encriptada
        String query = "SELECT * FROM usuariosasi_lecona WHERE nombre_usuario = ? AND contrasena = ?";
        pstmt = conexion.prepareStatement(query);
        pstmt.setString(1, nombre);
        pstmt.setString(2, hashPass);
        rs = pstmt.executeQuery();

        // Verificar si se encontró un registro que coincida
        if (rs.next()) {
            accesoPermitido = true;
            userType = rs.getString("tipo_usuario");
        }
    } catch (Exception e) {
        out.println("Error usuario: " + e.getMessage());
    }

    // Redirigir al usuario según el resultado de la validación
    if (accesoPermitido) {
        if (userType.equals("15")) {
            response.sendRedirect("inicio.jsp");
        } else {
            response.sendRedirect("inicio2.jsp");
        }
    } else {
        out.println("Usuario o contraseña incorrectos.");
    }
%>
