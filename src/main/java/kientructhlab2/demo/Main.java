package kientructhlab2.demo;

import kientructhlab2.Computer;
import kientructhlab2.ComputerFactory;
import kientructhlab2.PCFactory;
import kientructhlab2.ServerFactory;

public class Main {
    public static void main(String[] args) {
        Computer pc = ComputerFactory.getComputer(
                new PCFactory("8 GB", "512 GB SSD", "Intel Core i5"));

        Computer server = ComputerFactory.getComputer(
                new ServerFactory("32 GB", "2 TB NVMe", "AMD EPYC"));

        System.out.println("===== ABSTRACT FACTORY PATTERN =====");
        System.out.println("Tao doi tuong PC tu PCFactory:");
        System.out.println(pc);
        System.out.println();
        System.out.println("Tao doi tuong Server tu ServerFactory:");
        System.out.println(server);
    }
}
