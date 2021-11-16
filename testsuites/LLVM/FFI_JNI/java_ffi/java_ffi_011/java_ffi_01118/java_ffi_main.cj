// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan REDGREENBLUE
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

@java
external class Color <: Enum<Color> {
    public static let RED: Color = Color(J"RED", 0)
    public static let GREEN: Color = Color(J"GREEN", 1)
    public static let BLUE: Color = Color(J"BLUE", 2)
    init(s: JString, i: Int32) { super(s, i) }
}

func main() {
    let cls: InteropTest<Color> = InteropTest<Color>()
    cls.test(1, 2, JArray<Color>([Color.RED, Color.GREEN, Color.BLUE]))
    return 0
}
