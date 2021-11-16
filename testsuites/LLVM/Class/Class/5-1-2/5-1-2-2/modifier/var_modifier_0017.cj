// EXEC: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
    static var a : Int32 = 1
}

class Data <: Base {

}

func run(): Int64 {
    if (Data.a != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
