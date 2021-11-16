// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a = 8
    let b = 10
    let c = 12

    a <= b < c  // EXPECTED: regex illegal compare operation

    return 0
}
