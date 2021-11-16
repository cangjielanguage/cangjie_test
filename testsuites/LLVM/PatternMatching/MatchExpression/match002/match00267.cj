// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
enum Timeunit { Year(Int32) }
func test(): Int64 {
    var a = Timeunit.Year // EXPECTED:regex 'Year' is not a member of enum 'Timeunit'
//   match (Timeunit.Year(10)) {
//        case _ => 0
//    }
    return 0
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
