package java.util

import java.lang.*

@java
external interface List<T> {
    func add(e: T): Bool
}

@java
external class ArrayList<T> <: List<T> {
    func add(e: T): Bool {
        return true
    }
}
