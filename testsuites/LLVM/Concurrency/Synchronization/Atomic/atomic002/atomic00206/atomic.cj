// EXEC:%compiler %cmp_opt %sync-link %f -o %output
// EXEC:%run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in class B\nin interface A func test1\n

from std import sync.*

interface A {
    func test(): Unit {
        print("in interface A func test\n")
    }

    func test1(): Unit {
        print("in interface A func test1\n")
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
    let test = AtomicReference<A>(B("in class B\n"))

    let thread: Future<Unit> = spawn {
        test.load().test()
    }

    thread.getResult()

    test.load().test1()
    return 0
}
