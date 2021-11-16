// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in class B1\nin class B2\nin class B3\n

from std import sync.*

interface A {
    func test(): Unit {
        print("in interface A\n")
    }
}

class B <: A {
    var str: String = ""

    init(str: String) {
        this.str = str
    }

    func test(): Unit {
        print(str)
    }
}

func main(): Int64 {
    var test = AtomicReference<A>(B("in class B1\n"))
    test.load().test()

    let thread: Future<Unit> = spawn {
        var test = AtomicReference<A>(B("in class B2\n"))
        test.load().test()
    }

    thread.getResult()

    test = AtomicReference<A>(B("in class B3\n"))
    test.load().test()
    return 0
}
