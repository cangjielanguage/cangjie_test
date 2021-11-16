// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in class A\nin class A\n

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
    let test = AtomicReference<A>(A("in class A\n"))

    let thread: Future<Unit> = spawn {
        test.load().test()
    }

    thread.getResult()

    test.load().test()
    return 0
}
