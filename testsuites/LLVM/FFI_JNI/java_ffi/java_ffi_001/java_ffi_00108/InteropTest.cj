package test

import java.lang.*

// Replace with output file of `autosdk` in the future.
@java
external open class InteropTest <: java.lang.Object {
    func printInt32(input: Int32): Unit { /* compiled code */ }

    func isJavaObject(input: java.lang.Object): Bool { /* compiled code */ return false }
}
