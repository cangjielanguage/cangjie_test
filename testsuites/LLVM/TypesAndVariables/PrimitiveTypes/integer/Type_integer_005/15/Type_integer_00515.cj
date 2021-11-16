// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var int32_One: Int32 = %@!  // EXPECTED: regex expected expression here
    return 1
}
