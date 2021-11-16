// DEPENDENCE: InteropTest.cj InteropTest.java Color.java
// EXEC:%javac InteropTest.java Color.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda Color.class Color.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan RED\nRED\n0\ntrue\n0\nGREEN\nGREEN\n1\ntrue\n0\nBLUE\nBLUE\n2\ntrue\n0\n
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

func main() {
    var cls: InteropTest = InteropTest()
    let colorRed: Color = cls.test1()
    print(toString(colorRed.name()) + "\n")
    print(toString(colorRed.toString()) + "\n")
    print(colorRed.ordinal().toString() + "\n")
    print(colorRed.equals(Color.RED).toString() + "\n")
    print(colorRed.compareTo(Color.RED).toString() + "\n")
    let colorGreen: Color = cls.test2()
    print(toString(colorGreen.name()) + "\n")
    print(toString(colorGreen.toString()) + "\n")
    print(colorGreen.ordinal().toString() + "\n")
    print(colorGreen.equals(Color.GREEN).toString() + "\n")
    print(colorGreen.compareTo(Color.GREEN).toString() + "\n")
    let colorBlue: Color = cls.test3()
    print(toString(colorBlue.name()) + "\n")
    print(toString(colorBlue.toString()) + "\n")
    print(colorBlue.ordinal().toString() + "\n")
    print(colorBlue.equals(Color.BLUE).toString() + "\n")
    print(colorBlue.compareTo(Color.BLUE).toString() + "\n")
    return 0
}
