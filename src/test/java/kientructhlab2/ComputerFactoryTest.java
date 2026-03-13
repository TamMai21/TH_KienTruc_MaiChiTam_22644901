package kientructhlab2;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertInstanceOf;

class ComputerFactoryTest {
    @Test
    void shouldCreatePcFromPcFactory() {
        Computer computer = ComputerFactory.getComputer(new PCFactory("8 GB", "256 GB SSD", "Intel Core i5"));

        assertInstanceOf(PC.class, computer);
        assertEquals("8 GB", computer.getRam());
        assertEquals("256 GB SSD", computer.getHdd());
        assertEquals("Intel Core i5", computer.getCpu());
    }

    @Test
    void shouldCreateServerFromServerFactory() {
        Computer computer = ComputerFactory.getComputer(new ServerFactory("64 GB", "4 TB SSD", "AMD EPYC"));

        assertInstanceOf(Server.class, computer);
        assertEquals("64 GB", computer.getRam());
        assertEquals("4 TB SSD", computer.getHdd());
        assertEquals("AMD EPYC", computer.getCpu());
    }
}
