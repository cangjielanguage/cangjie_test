// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64{
    var a = 2
    var b = 2  // EXPECTED: regex illegal left value
     **= 2
    return 0
}
