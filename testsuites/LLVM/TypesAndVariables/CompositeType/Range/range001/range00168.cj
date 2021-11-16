// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a = func a(){}..func b(){}:func c(){}  // EXPECTED: regex expected expression here
    return 1
}
