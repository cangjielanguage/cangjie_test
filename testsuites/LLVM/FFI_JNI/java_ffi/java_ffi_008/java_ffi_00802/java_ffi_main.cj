// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan RED\nRED\n0\nfalse\n-1\nGREEN\nGREEN\n1\ntrue\n0\nBLUE\nBLUE\n2\nfalse\n1\n
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

func main() {
    var cls: InteropTest = InteropTest()
    cls.red = InteropTest.Color.RED
    print(toString(cls.red.name()) + "\n")
    print(toString(cls.red.toString()) + "\n")
    print(cls.cls.red.ordinal().toString() + "\n")
    print(cls.red.equals(InteropTest.Color.GREEN).toString() + "\n")
    print(cls.red.compareTo(InteropTest.Color.GREEN).toString() + "\n")
    cls.green = InteropTest.Color.RED
    print(toString(cls.green.name()) + "\n")
    print(toString(cls.green.toString()) + "\n")
    print(cls.green.ordinal().toString() + "\n")
    print(cls.green.equals(InteropTest.Color.GREEN).toString() + "\n")
    print(cls.green.compareTo(InteropTest.Color.GREEN).toString() + "\n")
    cls.blue = InteropTest.Color.RED
    print(toString(cls.blue.name()) + "\n")
    print(toString(cls.blue.toString()) + "\n")
    print(cls.blue.ordinal().toString() + "\n")
    print(cls.blue.equals(InteropTest.Color.GREEN).toString() + "\n")
    print(cls.blue.compareTo(InteropTest.Color.GREEN).toString() + "\n")
    return 0
}
