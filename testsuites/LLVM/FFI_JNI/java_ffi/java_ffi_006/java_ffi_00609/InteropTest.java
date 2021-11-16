package test;

import java.util.List;

public class InteropTest<T> {
    public void removeCat(List<? extends T> animalList, T animal) {
        animalList.remove(animal);
        System.out.println("animal Removed");
    }

    public void printAll(List<?> list) {
        for (Object obj : list) {
            System.out.println(obj);
        }
    }
}
