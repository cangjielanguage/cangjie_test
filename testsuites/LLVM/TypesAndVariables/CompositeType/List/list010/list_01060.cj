// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func test(): Int64 {
    var a = [try] // EXPECTED: regex error.*invalid expression initialization
    return a.size() - 1
}

func main(): Int64 {
    return test()
}
