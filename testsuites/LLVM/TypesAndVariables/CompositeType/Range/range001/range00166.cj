// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a = (return 0)..(return 0):(return 0) // EXPECTED: regex integer type is expected for start, stop and step in range expression
    return 0
}
