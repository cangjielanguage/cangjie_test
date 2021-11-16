// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
    interface test { // EXPECTED: regex interface type must be toplevel
        let aa: Int32 = 1
    }
}

class Data <: Base {
    var test: Int32 = 2
}

func main(): Int64 {
    var obj = Data()

    var res1:Int32 = Base.test.aa
    var res2:Int32 = obj.test

    if (res1 !=1 || res2 != 2) {
        return 1
    }
    return 0
}
