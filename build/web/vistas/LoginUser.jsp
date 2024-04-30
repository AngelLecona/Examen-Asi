<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.math.BigInteger" %>
<%
    String nombre = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conexion = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean accesoPermitido = false;
    String userType = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/bdexaasi_bernal", "root", "");
        
        // Encriptar la contraseña proporcionada con SHA
        MessageDigest md = MessageDigest.getInstance("SHA");
        md.update(password.getBytes());
        byte[] bytes = md.digest();
        BigInteger bi = new BigInteger(1, bytes);
        String hashedPassword = bi.toString(16);

        // Preparar la consulta SQL para buscar el usuario y la contraseña encriptada
        String query = "SELECT * FROM usuariosasi_bernal WHERE nombre = ? AND password = ?";
        pstmt = conexion.prepareStatement(query);
        pstmt.setString(1, nombre);
        pstmt.setString(2, hashedPassword);
        rs = pstmt.executeQuery();

        // Verificar si se encontró un registro que coincida
        if (rs.next()) {
            accesoPermitido = true;
            userType = rs.getString("typeuser");
        }
    } catch (Exception e) {
        out.println("Error al validar el usuario: " + e.getMessage());
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException ignore) {
            }
        }
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

    // Redirigir al usuario según el resultado de la validación
    if (accesoPermitido) {
        if (userType.equals("1")) {
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("home_1.jsp");
        }
    } else {
        out.println("Acceso denegado. Usuario o contraseña incorrectos.");
    }
%>
