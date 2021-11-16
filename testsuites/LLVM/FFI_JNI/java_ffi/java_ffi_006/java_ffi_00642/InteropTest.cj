package test

import java.lang.*
import java.util.List as JList

@java
external class InteropTest {
    func removeCat<T>(animalList: JList<java.lang.Object>, animal: T): Unit {}
    func printAll<T>(animalList: JList<java.lang.Object>): Unit {}
}

@java
external open class Animal {}

@java
external open class Cat <: Animal {}
