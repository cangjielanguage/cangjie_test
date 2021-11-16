// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in class B1\nin class B2\n

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
    let test = AtomicReference<A>(B("in class B1\n"))
    var cls = test.swap(B("in class B2\n"))
    cls.test()

    let thread: Future<Unit> = spawn {
        var cls = test.swap(B("in class B3\n"))
        cls.test()
    }

    thread.getResult()
    return 0
}
