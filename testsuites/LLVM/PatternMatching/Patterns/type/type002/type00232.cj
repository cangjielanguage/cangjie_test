// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface A {
    interface B{} // EXPECTED: regex interface type must be toplevel
}

class C <: A.B{}

func test(): Int64 {
    var res = match (C()) {
        case a : A.B => 0
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
