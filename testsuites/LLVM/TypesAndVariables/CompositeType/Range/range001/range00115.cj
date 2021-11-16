// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a = 1. . .10    // EXPECTED: regex expected identifier her
    return 0
}
