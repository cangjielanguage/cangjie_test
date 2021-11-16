// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'deep_test'

func main(): Int64 {
    func test(): Int64 {
        func deep_test() : Int64 {
            return 0
        }
        return 0
    }
    return deep_test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
