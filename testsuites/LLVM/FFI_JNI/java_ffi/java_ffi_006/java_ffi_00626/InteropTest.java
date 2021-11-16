package test;

import java.util.List;

public interface InteropTest<T> {
    default public void removeCat(List<? extends T> animalList, T animal) {
        animalList.remove(animal);
        System.out.println("animal Removed");
    }

    default public void printAll(List<?> list) {
        for (Object obj : list) {
            System.out.println(obj);
        }
    }
}
