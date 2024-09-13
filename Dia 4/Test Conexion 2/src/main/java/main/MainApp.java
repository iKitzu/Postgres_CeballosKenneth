package main;

import controller.VehiculoController;
import model.VehiculoDAO;
import view.VehiculoView;

public class MainApp {
    public static void main(String[] args) {
        VehiculoDAO vehiculoDAO = new VehiculoDAO();
        VehiculoView vehiculoView = new VehiculoView();
        VehiculoController controller = new VehiculoController(vehiculoDAO, vehiculoView);
        controller.iniciarAplicacion();
    }
}
