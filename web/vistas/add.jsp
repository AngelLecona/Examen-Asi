<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.math.BigInteger" %>
<%
    // Recuperar los valores enviados desde el formulario
    String nombre = request.getParameter("nombre");
    String pass = request.getParameter("pass");
    int typeuser = 5;

    Connection conexion = null;
    PreparedStatement pstmt = null;

    try {
        // Cargar el driver de MySQL
        Class.forName("com.mysql.jdbc.Driver");
        // Establecer la conexión con la base de datos
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/bdexaasi_bernal", "root", "");

        // Encriptar la contraseña usando SHA
        MessageDigest md = MessageDigest.getInstance("SHA");
        md.update(pass.getBytes());
        byte[] bytes = md.digest();
        BigInteger bi = new BigInteger(1, bytes);
        String hashedPass = bi.toString(16);

        // Preparar la consulta SQL para insertar los datos
        String query = "INSERT INTO usuariosasi_bernal (nombre, password, typeuser) VALUES (?, ?, ?)";
        pstmt = conexion.prepareStatement(query);
        pstmt.setString(1, nombre);
        pstmt.setString(2, hashedPass); // Insertar la contraseña encriptada
        pstmt.setInt(3, typeuser);

        // Ejecutar la consulta
        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected > 0) {
            out.println("Usuario agregado exitosamente.");
            response.sendRedirect("home.jsp");
        } else {
            out.println("No se pudo agregar el usuario.");
        }
    } catch (Exception e) {
        out.println("Error al agregar el usuario: " + e.getMessage());
    } finally {
        // Cerrar los recursos
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conexion != null) try { conexion.close(); } catch (SQLException ignore) {}
    }
%>
