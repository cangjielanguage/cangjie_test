package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest <: Enum<InteropTest> {
    public static let RED: InteropTest = InteropTest(J"RED", 0)
    public static let GREEN: InteropTest = InteropTest(J"GREEN", 1)
    public static let BLUE: InteropTest = InteropTest(J"BLUE", 2)
    init(s: JString, i: Int32) { super(s, i) }
}
