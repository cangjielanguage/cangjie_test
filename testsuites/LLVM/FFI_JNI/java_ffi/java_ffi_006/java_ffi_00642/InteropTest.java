package test;

import java.util.List;

public class InteropTest {
    public <T> void removeCat(List<? extends T> animalList, T animal) {
        animalList.remove(animal);
        System.out.println("animal Removed");
    }

    public <T> void printAll(List<?> list) {
        for (Object obj : list) {
            System.out.println(obj);
        }
    }
}
