// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a = 11
    let b = 10
    let c = 9

    a > b > c  // EXPECTED: regex illegal compare operation

    return 0
}
