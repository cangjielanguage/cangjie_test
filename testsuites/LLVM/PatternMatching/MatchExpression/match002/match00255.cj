// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex expected member name or constructor call after 'Timeunit' type name
enum Timeunit { Year(Int32) }
func test(): Int64 {
    var a = Timeunit
    match (Timeunit.Year(10)) {
        case _ => 0
    }
    return 0
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
