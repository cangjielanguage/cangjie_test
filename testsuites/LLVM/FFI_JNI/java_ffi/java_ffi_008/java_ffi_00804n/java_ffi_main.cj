// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not Exception

package test

import java.lang.*
from ffi import java.*

@java
external open class InteropTest {
    public func test(color: Color): Unit {}
}

@java
external open class Color <: Enum<Color> { // EXPECTED: regex 'open' cannot be used here for subclasses of java.lang.Enum
    public static let RED: Color = Color(J"RED", 0)
    public static let GREEN: Color = Color(J"GREEN", 1)
    public static let BLUE: Color = Color(J"BLUE", 2)
    init(s: JString, i: Int32) { super(s, i) }
}
