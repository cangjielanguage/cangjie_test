// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func test(){  // EXPECTED: regex note.* to match this '{'

func main(): Int32 {
    test()
    return 0
}  // EXPECTED: regex error.* expected '}'
