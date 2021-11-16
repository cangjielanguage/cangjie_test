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
    let red: InteropTest = InteropTest.RED
    print(toString(red.name()) + "\n")
    print(toString(red.toString()) + "\n")
    print(red.ordinal().toString() + "\n")
    print(red.equals(InteropTest.GREEN).toString() + "\n")
    print(red.compareTo(InteropTest.GREEN).toString() + "\n")
    let green: InteropTest = InteropTest.GREEN
    print(toString(green.name()) + "\n")
    print(toString(green.toString()) + "\n")
    print(green.ordinal().toString() + "\n")
    print(green.equals(InteropTest.GREEN).toString() + "\n")
    print(green.compareTo(InteropTest.GREEN).toString() + "\n")
    let blue: InteropTest = InteropTest.BLUE
    print(toString(blue.name()) + "\n")
    print(toString(blue.toString()) + "\n")
    print(blue.ordinal().toString() + "\n")
    print(blue.equals(InteropTest.GREEN).toString() + "\n")
    print(blue.compareTo(InteropTest.GREEN).toString() + "\n")
    return 0
}
