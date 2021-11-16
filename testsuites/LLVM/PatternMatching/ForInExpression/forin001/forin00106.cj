// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test(): Int64 {
    let myList: Array<Int32> = @{0,1,2}
    for (i in myList) if (i > 1) {
        return 0
        i = i + 1 // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant
    }
    return 1
}

func main(): Int64 {
    return test()
}
