package test

import java.lang.*
from ffi import java.*

@java
external interface InteropTest {
    func test(array: JArray<Color>): Unit {}
}

@java
external class Color <: Enum<Color> {
    public static let RED: Color = Color(J"RED", 0)
    public static let GREEN: Color = Color(J"GREEN", 1)
    public static let BLUE: Color = Color(J"BLUE", 2)
    init(s: JString, i: Int32) { super(s, i) }
}
