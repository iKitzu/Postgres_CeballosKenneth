package view;

import java.util.Scanner;

public class VehiculoView {
    private Scanner scanner = new Scanner(System.in);

    public int mostrarMenu() {
        System.out.println("1. Agregar Vehículo");
        System.out.println("2. Mostrar Vehículos");
        System.out.println("3. Actualizar Vehículo");
        System.out.println("4. Eliminar Vehículo");
        System.out.println("5. Salir");
        System.out.print("Seleccione una opción: ");
        return scanner.nextInt();
    }

    public String capturarMarca() {
        System.out.print("Ingrese la marca del vehículo: ");
        return scanner.next();
    }

    public String capturarModelo() {
        System.out.print("Ingrese el modelo del vehículo: ");
        return scanner.next();
    }

    public int capturarAño() {
        System.out.print("Ingrese el año del vehículo: ");
        return scanner.nextInt();
    }

    public double capturarPrecio() {
        System.out.print("Ingrese el precio del vehículo: ");
        return scanner.nextDouble();
    }

    public String capturarEstado() {
        System.out.print("Ingrese el estado del vehículo (nuevo/usado): ");
        return scanner.next();
    }

    public int capturarIdVehiculo() {
        System.out.print("Ingrese el ID del vehículo: ");
        return scanner.nextInt();
    }
}
