/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConexionBD {
    public static void main(String[] args) {
        Connection conexion = null;
        Statement s = null;

        try {
            // Cargar el controlador de MySQL
            Class.forName("com.mysql.jdbc.Driver");
            // Establecer la conexión con la base de datos
            conexion = DriverManager.getConnection(
                    "jdbc:mysql://localhost/bdexaasi_bernal", "root", "");
            // Crear un objeto Statement para ejecutar consultas SQL
            s = conexion.createStatement();
            // Aquí puedes agregar más operaciones con la base de datos
            // ...
        } catch (ClassNotFoundException e1) {
            // Manejar el caso en el que no se pueda cargar el controlador
            System.out.println("ERROR: No se puede encontrar el controlador de la BD: " + e1.getMessage());
        } catch (SQLException e2) {
            // Manejar otros errores relacionados con la conexión
            System.out.println("ERROR: Problema de conexión con la BD: " + e2.getMessage());
        } finally {
            // Cerrar la conexión y el Statement en el bloque finally para asegurar su ejecución
            try {
                if (s != null) {
                    s.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e3) {
                System.out.println("ERROR: Problema al cerrar la conexión: " + e3.getMessage());
            }
        }
    }
}
