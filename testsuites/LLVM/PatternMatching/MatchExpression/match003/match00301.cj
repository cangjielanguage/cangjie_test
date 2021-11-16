// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func test(): Int64 {
    var i : Int32 = 0
    match (i) {
        case 0 => // EXPECTED: regex at least one expression or declaration after '=>' in case body
        case _ => // EXPECTED: regex at least one expression or declaration after '=>' in case body
    }
    return 0
}

func main(): Int64 {
    return test()
}
