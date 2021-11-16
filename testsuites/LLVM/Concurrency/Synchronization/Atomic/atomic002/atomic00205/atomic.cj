// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in class A1\nin class A2\nin class A3\n

from std import sync.*

class A {
    var str: String = ""

    init(str: String) {
        this.str = str
    }

    func test(): Unit {
        print(str)
    }
}

func main(): Int64 {
    var test = AtomicReference<A>(A("in class A1\n"))
    test.load().test()

    let thread: Future<Unit> = spawn {
        var test = AtomicReference<A>(A("in class A2\n"))
        test.load().test()
    }

    thread.getResult()

    test = AtomicReference<A>(A("in class A3\n"))
    test.load().test()
    return 0
}
