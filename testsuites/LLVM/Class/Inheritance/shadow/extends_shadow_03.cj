// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


open class Base {
    interface test { // EXPECTED: regex interface type must be toplevel
        let aaa : Int32 = 1
    }
}

class Data <: Base {
    interface test { // EXPECTED: regex interface type must be toplevel
        let aaa : Int32 = 2
    }
}

func main(): Int64 {
    var res : Int32 = Data.test.aaa
    if (res != 2) {
        return 1
    }
    return 0
}
