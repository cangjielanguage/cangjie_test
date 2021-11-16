// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected expression here
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func test(): Int64 {
    match (Int32) {
        case _ => 0
    }
    return 0
}

func main(): Int64 {
    return test()
}
