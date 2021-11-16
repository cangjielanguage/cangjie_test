package test

import java.lang.Object

// Replace with output file of `autosdk` in the future.
external class InteropTest <: java.lang.Object {
    // The type of input should be `java.lang.Object`, to replace in the future when bug fixed.
    func testObject(input: core.Object): java.lang.Object { /* compiled code */ return java.lang.Object() }

    func isJavaObject(input: core.Object): Bool { /* compiled code */ return false }
}
