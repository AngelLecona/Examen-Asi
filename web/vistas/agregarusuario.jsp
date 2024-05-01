<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.math.BigInteger" %>
<%
    // Recuperar los valores enviados desde el formulario
    String nombre = request.getParameter("nombre");
    String contrasena = request.getParameter("contrasena");
    int typeuser = 0;

    Connection conexion = null;
    PreparedStatement pstmt = null;

    try {
        // Cargar el driver de MySQL
        Class.forName("com.mysql.jdbc.Driver");
        // Establecer la conexión con la base de datos
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/bdexaasi_lecona", "root", "");

        // Encriptar la contraseña usando SHA
        MessageDigest md = MessageDigest.getInstance("SHA");
        md.update(contrasena.getBytes());
        byte[] bytes = md.digest();
        BigInteger bi = new BigInteger(1, bytes);
        String hashedPass = bi.toString(16);

        // Preparar la consulta SQL para insertar los datos
        String query = "INSERT INTO usuariosasi_lecona (nombre_usuario, contrasena, tipo_usuario) VALUES (?, ?, ?)";
        pstmt = conexion.prepareStatement(query);
        pstmt.setString(1, nombre);
        pstmt.setString(2, hashedPass); // Insertar la contraseña encriptada
        pstmt.setInt(3, typeuser);

        // Ejecutar la consulta
        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected > 0) {
            
            response.sendRedirect("inicio.jsp");
        } else {
            out.println("No se pudo agregar");
        }
    } catch (Exception e) {
        out.println("Error al agregar: " + e.getMessage());
    }
%>
