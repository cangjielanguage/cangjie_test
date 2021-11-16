package test;

import java.util.List;

public interface InteropTest<T> {
    default public void addCat(List<? super T> animalList, T animal) {
        animalList.add(animal);
        System.out.println("animal Added");
    }

    default public void printAll(List<?> list) {
        for (Object obj : list) {
            System.out.println(obj);
        }
    }
}
