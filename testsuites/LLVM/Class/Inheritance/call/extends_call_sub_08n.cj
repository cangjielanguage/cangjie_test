// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

open class Base {
    static var one : Int32 = 1
}

class Data <: Base {}

func main(): Int64 {
    var res : Int32 = Data.one
    if (res != 1) {
        return 1
    }
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
