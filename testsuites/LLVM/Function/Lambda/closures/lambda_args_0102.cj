// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

var a3 = { a => a} // EXPECTED: regex error.*?parameters of this lambda expression must have type annotations
