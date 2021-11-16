package test;

import java.util.List;

public class InteropTest {
    public <T> void addCat(List<? super T> animalList, T animal) {
        animalList.add(animal);
        System.out.println("animal Added");
    }

    public <T> void printAll(List<?> list) {
        for (Object obj : list) {
            System.out.println(obj);
        }
    }
}
