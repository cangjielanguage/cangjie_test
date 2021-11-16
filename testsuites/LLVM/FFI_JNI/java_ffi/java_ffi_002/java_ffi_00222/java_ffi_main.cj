// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan 6
// ASSERT: scan-not Exception

import test.*
import java.lang.Object

func main() {
    let interopTest: InteropTest = InteropTest()
    let thread1: Future<Unit> = spawn {
        interopTest.test(1)
    }

    let thread2: Future<Unit> = spawn {
        interopTest.test(1)
    }

    let thread3: Future<Unit> = spawn {
        interopTest.test(1)
    }

    let thread4: Future<Unit> = spawn {
        interopTest.test(1)
    }

    let thread5: Future<Unit> = spawn {
        interopTest.test(1)
    }

    thread1.getResult()
    thread2.getResult()
    thread3.getResult()
    thread4.getResult()
    thread5.getResult()
    print(interopTest.getNum().toString())
    return 0
}
