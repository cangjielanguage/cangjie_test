// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base {
    static var one : Int32 = 1
}

class Data <: Base {}

func main(): Int64 {
    var obj = Data()
    var res : Int32 = obj.one  // EXPECTED: regex 'one' is not a member of class 'Data'
    if (res != 1) {
        return 1
    }
    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
