// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(): Int64 {
    var i : Int32 = 1
    var myData : Array<Int32> = {0}
    match (i) {
        case _ => type myType=Int32 // EXPECTED: regex type must be declared on toplevel
    }
    return 0
}

func main(): Int64 {
    return test()
}
