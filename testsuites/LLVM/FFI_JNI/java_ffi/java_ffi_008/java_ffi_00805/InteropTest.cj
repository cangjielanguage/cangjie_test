package test

import java.lang.*
from ffi import java.*

@java
external open class InteropTest {
    public func test(color: Color): Unit {}
}

@java
external class Color <: Enum<Color> {
    public static let RED: Color = Color(J"RED", 0)
    public static let GREEN: Color = Color(J"GREEN", 1)
    public static let BLUE: Color = Color(J"BLUE", 2)
    init(s: JString, i: Int32) { super(s, i) }
}
