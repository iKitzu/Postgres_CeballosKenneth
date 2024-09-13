package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:postgresql://172.16.101.159:5432/filtro_ceballoskenneth";
    private static final String USER = "postgres";
    private static final String PASSWORD = "1097095601";
    
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
    
}
