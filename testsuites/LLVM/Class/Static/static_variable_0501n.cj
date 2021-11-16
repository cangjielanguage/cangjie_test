// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
    static protected let a: Int32 = 1
}

class Data <: Base {
    static let b:Int32 = a
}

func run(): Int64 {
    if (Data.b != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
