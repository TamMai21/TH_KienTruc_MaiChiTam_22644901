package kientructhlab2;

public final class ComputerFactory {
    private ComputerFactory() {
    }

    public static Computer getComputer(ComputerAbstractFactory factory) {
        return factory.createComputer();
    }
}
