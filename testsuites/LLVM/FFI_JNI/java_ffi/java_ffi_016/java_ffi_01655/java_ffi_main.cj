// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$Color.class' 'InteropTest$Color.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan RED\nRED\n0\nBLUE\nBLUE\n1\nGREEN\nGREEN\n2\nRED\nBLUE\nGREEN\nRED\nBLUE\nGREEN\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

func main(): Int64 {
    var red: InteropTest.Color = InteropTest.Color.RED
    var blue: InteropTest.Color = InteropTest.Color.BLUE
    var green: InteropTest.Color = InteropTest.Color.GREEN
    var colors = InteropTest.Color.values()
    print(toString(red.name()) + "\n")
    print(toString(red.toString()) + "\n")
    print(red.ordinal().toString() + "\n")
    print(toString(blue.name()) + "\n")
    print(toString(blue.toString()) + "\n")
    print(blue.ordinal().toString() + "\n")
    print(toString(green.name()) + "\n")
    print(toString(green.toString()) + "\n")
    print(green.ordinal().toString() + "\n")
    print(toString(InteropTest.Color.valueOf(J"RED").name()) + "\n")
    print(toString(InteropTest.Color.valueOf(J"BLUE").name()) + "\n")
    print(toString(InteropTest.Color.valueOf(J"GREEN").name()) + "\n")
    print(toString(colors[0].name()) + "\n")
    print(toString(colors[1].name()) + "\n")
    print(toString(colors[2].name()) + "\n")
    return 0
}
