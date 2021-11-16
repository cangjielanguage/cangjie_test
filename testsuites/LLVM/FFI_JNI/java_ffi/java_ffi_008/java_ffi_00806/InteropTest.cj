package test

import java.lang.*
from ffi import java.*

@java
external open class InteropTest {
    public func test1(): Color { return Color.RED }
    public func test2(): Color { return Color.RED }
    public func test3(): Color { return Color.RED }
}

@java
external class Color <: Enum<Color> {
    public static let RED: Color = Color(J"RED", 0)
    public static let GREEN: Color = Color(J"GREEN", 1)
    public static let BLUE: Color = Color(J"BLUE", 2)
    init(s: JString, i: Int32) { super(s, i) }
}
