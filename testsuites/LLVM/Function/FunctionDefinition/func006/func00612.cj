// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'i'

func main(): Int64 {
    func test(): Int64 {
        var i : Int64 = 0
        func deep_test() : Int64 {
            return i
        }
        return deep_test()
    }
    func test2():Int64 {
        return i // undeclared identifier i
    }
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
