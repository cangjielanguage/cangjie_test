// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var r : Int32 = 2  // EXPECTED: regex illegal left value
     = r
    return 0
}
