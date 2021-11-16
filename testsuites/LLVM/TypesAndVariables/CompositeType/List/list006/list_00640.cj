// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func test(): Int64 {
    var a: List<Int64> = [1,2,3]
    return get(a) // EXPECTED: regex undeclared identifier 'get'
}

func main(): Int64 {
    test()
}
