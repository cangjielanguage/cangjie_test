// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
    func test(): Int32 { return 1 }
}

class Data <: Base {
    interface test { // EXPECTED: regex interface type must be toplevel
        let aa: Int32 = 2
    }
}

func main(): Int64 {
    var obj = Base()

    var res1 = obj.test()
    var res2 = Data.test.aa
    if (res1 != 1 || res2 !=2) {
        return 1
    }
    return 0
}
