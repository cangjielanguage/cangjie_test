package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var red: Color
    public func test(): Unit {}
}

@java
external class Color <: Enum<Color> {
    public static let RED: Color = Color(J"RED", 0)
    init(s: JString, i: Int32) { super(s, i) }
}
