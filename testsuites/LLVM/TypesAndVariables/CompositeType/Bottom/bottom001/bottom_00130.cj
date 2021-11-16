// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func test() {
    var x : bigFloat // EXPECTED: regex undeclared type name 'bigFloat'
    x = return
}

func main(): Int64 {
    test()
    return 0
}
