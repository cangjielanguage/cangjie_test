// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface A{
    class B{} // EXPECTED: regex class type must be toplevel
}

func test(): Int64 {
    var i : A.B = A.B()
    var res = match (i) {
        case i : A.B => 0
        case _ => 1
    }
    if (res != 0) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return test()
}
