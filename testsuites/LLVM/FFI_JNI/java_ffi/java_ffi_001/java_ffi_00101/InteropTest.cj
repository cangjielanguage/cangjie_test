package test

import java.lang.*

// Replace with output file of `autosdk` in the future.
@java
external class InteropTest <: java.lang.Object {
    // The type of input should be `java.lang.Object`, to replace in the future when bug fixed.
    func testObject(input: core.Object): Unit { /* compiled code */ }

    func isJavaObject(input: core.Object): Bool { /* compiled code */ return false }
}
