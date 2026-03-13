package kientructhlab2;

public class Lab2Main {
    public static void main(String[] args) {
        Computer pc = ComputerFactory.getComputer(new PCFactory("8 GB", "512 GB SSD", "Intel Core i5"));
        Computer server = ComputerFactory.getComputer(new ServerFactory("32 GB", "2 TB NVMe", "AMD EPYC"));

        System.out.println("=== ABSTRACT FACTORY PATTERN - LAB 2 ===");
        System.out.println("PC Config     : " + pc);
        System.out.println("Server Config : " + server);
    }
}
