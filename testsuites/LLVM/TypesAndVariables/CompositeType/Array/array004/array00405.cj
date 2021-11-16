// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let myArray = @{0.1,1,'a'}  // EXPECTED: regex inconsistent element type for array literal
    return 1
}
