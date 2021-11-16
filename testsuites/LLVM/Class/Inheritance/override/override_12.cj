// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in class B\n

open class A {
    open func test(): Unit {
        print("in interface A\n")
    }
}

class B <: A {
    var str: String = ""

    init(str: String) {
        this.str = str
    }

    override func test(): Unit {
        print(str)
    }
}

func main(): Int64 {
    var a = 0
    var c: A = B("in class B\n")
    c.test()
    return 0
}

