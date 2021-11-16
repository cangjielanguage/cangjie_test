// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base {}

class Data <: Base {
    static var one : Int32 = 1
}

func main(): Int64 {
    var obj = Data()
    var res : Int32 = obj.one // EXPECTED: regex object cannot access static member 'one'
    if (res != 1) {
        return 1
    }
    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
