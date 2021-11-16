// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func test(): Int64 {
    return [0][0][0] // EXPECTED: regex invalid subscript operator \[\] on type 'Int64' and 'Int'
}

func main(): Int64 {
    test()
}
