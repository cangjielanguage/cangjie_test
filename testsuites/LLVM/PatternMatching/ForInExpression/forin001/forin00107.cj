// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-auto missing ')' in forIn expression
func test(): Int64 {
    let myList: Array<Int32> = @{0,1,2}
    for (i in myList i > 1) {
        return 0
        i = i + 1
    }
    return 1
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
