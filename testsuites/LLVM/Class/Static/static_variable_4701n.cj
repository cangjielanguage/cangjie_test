// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


open class Base {
    static let a: Int32 = 2

}

class Data <: Base {
    var b: Int32
    init(x: Int32) {
        super()
        b = a + x
    }
}

func run(): Int64 {
    var data: Data = Data(1)
    if (Data.a == 2 && data.b == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
