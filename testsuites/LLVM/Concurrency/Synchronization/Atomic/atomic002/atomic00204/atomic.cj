// EXEC:%compiler %cmp_opt  %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in class A1\nin class A2\n

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
    let cls = A("in class A1\n")
    let test = AtomicReference<A>(cls)

    let thread: Future<Unit> = spawn {

        test.load().test()
        var a = test.compareAndSwap(cls, A("in class A2\n"))
    }

    thread.getResult()

    test.load().test()
    return 0
}
