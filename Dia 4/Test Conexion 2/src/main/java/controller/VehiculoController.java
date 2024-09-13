package controller;

import model.Vehiculo;
import model.VehiculoDAO;
import view.VehiculoView;

import java.util.List;

public class VehiculoController {
    private VehiculoDAO vehiculoDAO;
    private VehiculoView vehiculoView;

    public VehiculoController(VehiculoDAO vehiculoDAO, VehiculoView vehiculoView) {
        this.vehiculoDAO = vehiculoDAO;
        this.vehiculoView = vehiculoView;
    }

    public void iniciarAplicacion() {
        boolean continuar = true;
        while (continuar) {
            int opcion = vehiculoView.mostrarMenu();
            switch (opcion) {
                case 1:
                    agregarVehiculo();
                    break;
                case 2:
                    mostrarVehiculos();
                    break;
                case 3:
                    actualizarVehiculo();
                    break;
                case 4:
                    eliminarVehiculo();
                    break;
                case 5:
                    continuar = false;
                    break;
                default:
                    System.out.println("Opción no válida.");
            }
        }
    }

    private void agregarVehiculo() {
        String marca = vehiculoView.capturarMarca();
        String modelo = vehiculoView.capturarModelo();
        int año = vehiculoView.capturarAño();
        double precio = vehiculoView.capturarPrecio();
        String estado = vehiculoView.capturarEstado();

        Vehiculo vehiculo = new Vehiculo(marca, modelo, año, precio, estado);
        if (vehiculoDAO.insertarVehiculo(vehiculo)) {
            System.out.println("Vehículo agregado correctamente.");
        } else {
            System.out.println("Error al agregar el vehículo.");
        }
    }

    private void mostrarVehiculos() {
        List<Vehiculo> vehiculos = vehiculoDAO.obtenerVehiculos();
        for (Vehiculo v : vehiculos) {
            System.out.println(v.getIdVehiculo() + " - " + v.getMarca() + " " + v.getModelo() + " (" + v.getAño() + ") - " + v.getPrecio() + " - " + v.getEstado());
        }
    }

    private void actualizarVehiculo() {
        int idVehiculo = vehiculoView.capturarIdVehiculo();
        String marca = vehiculoView.capturarMarca();
        String modelo = vehiculoView.capturarModelo();
        int año = vehiculoView.capturarAño();
        double precio = vehiculoView.capturarPrecio();
        String estado = vehiculoView.capturarEstado();

        Vehiculo vehiculo = new Vehiculo(marca, modelo, año, precio, estado);
        vehiculo.setIdVehiculo(idVehiculo);

        if (vehiculoDAO.actualizarVehiculo(vehiculo)) {
            System.out.println("Vehículo actualizado correctamente.");
        } else {
            System.out.println("Error al actualizar el vehículo.");
        }
    }

    private void eliminarVehiculo() {
        int idVehiculo = vehiculoView.capturarIdVehiculo();
        if (vehiculoDAO.eliminarVehiculo(idVehiculo)) {
            System.out.println("Vehículo eliminado correctamente.");
        } else {
            System.out.println("Error al eliminar el vehículo.");
        }
    }
}
