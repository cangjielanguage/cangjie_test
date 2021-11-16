package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    @java
    public class Color <: Enum<Color> {
        public static let RED: Color = Color(J"RED", 0)
        public static let GREEN: Color = Color(J"GREEN", 1)
        public static let BLUE: Color = Color(J"BLUE", 2)
        init(s: JString, i: Int32) { super(s, i) }
    }

    public var red: Color
    public var green: Color
    public var blue: Color
}

