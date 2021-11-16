package test

import java.lang.*

// Replace with output file of `autosdk` in the future.
external class InteropTest <: java.lang.Object & Cloneable {
    func printInt32(input: Int32): Unit { /* compiled code */ }

    func isJavaObject(input: core.Object): Bool { /* compiled code */ return false }
}
