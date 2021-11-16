// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
}

class Data <: Base {
    var test : Int32 = 1
}

func main(): Int64 {
    var obj : Data = Data(Base()) // EXPECTED: regex no matching constructor for call
    var res : Int32 = obj.test
    if (res != 1) {
        return 1
    }
    return 0
}
