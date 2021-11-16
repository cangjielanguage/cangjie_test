// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func test() {
    var x : bigInt // EXPECTED: regex undeclared type name 'bigInt'
    x = return
}

func main(): Int64 {
    test()
    return 0
}
