// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func test(): Int64 {
    var a = """
    ${return 0}"""// EXPECTED: regex undeclared identifier 'toString'
    return 1
}

func main(): Int64 {
    return test()
}
