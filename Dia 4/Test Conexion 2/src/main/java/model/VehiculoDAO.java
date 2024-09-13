package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import util.DatabaseConnection;

public class VehiculoDAO {

    public boolean insertarVehiculo(Vehiculo vehiculo) {
        String query = "INSERT INTO Vehiculo (marca, modelo, año, precio, estado) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, vehiculo.getMarca());
            stmt.setString(2, vehiculo.getModelo());
            stmt.setInt(3, vehiculo.getAño());
            stmt.setDouble(4, vehiculo.getPrecio());
            stmt.setString(5, vehiculo.getEstado());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Vehiculo> obtenerVehiculos() {
        String query = "SELECT * FROM Vehiculo";
        List<Vehiculo> vehiculos = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Vehiculo vehiculo = new Vehiculo();
                vehiculo.setIdVehiculo(rs.getInt("id_vehiculo"));
                vehiculo.setMarca(rs.getString("marca"));
                vehiculo.setModelo(rs.getString("modelo"));
                vehiculo.setAño(rs.getInt("año"));
                vehiculo.setPrecio(rs.getDouble("precio"));
                vehiculo.setEstado(rs.getString("estado"));
                vehiculos.add(vehiculo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehiculos;
    }

    public boolean actualizarVehiculo(Vehiculo vehiculo) {
        String query = "UPDATE Vehiculo SET marca = ?, modelo = ?, año = ?, precio = ?, estado = ? WHERE id_vehiculo = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, vehiculo.getMarca());
            stmt.setString(2, vehiculo.getModelo());
            stmt.setInt(3, vehiculo.getAño());
            stmt.setDouble(4, vehiculo.getPrecio());
            stmt.setString(5, vehiculo.getEstado());
            stmt.setInt(6, vehiculo.getIdVehiculo());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminarVehiculo(int idVehiculo) {
        String query = "DELETE FROM Vehiculo WHERE id_vehiculo = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, idVehiculo);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
