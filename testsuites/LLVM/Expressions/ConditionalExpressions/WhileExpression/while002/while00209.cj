// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    while () {  // EXPECTED: regex invalid expression initialization
        return 1
    }
    return 0
}
