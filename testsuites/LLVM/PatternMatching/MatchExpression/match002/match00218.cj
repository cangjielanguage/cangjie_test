// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'nothing'
func test(): Int64 {
    match (nothing) {
        case _ => 0
    }
    return 0
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
