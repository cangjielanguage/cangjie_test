package java.lang

@java
external interface Comparable<T> {}

@java
external open class Number {}

@java
external class Integer <: Number & Comparable<Integer> {
    init(val:Int32) {}
}
