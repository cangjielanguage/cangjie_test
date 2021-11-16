// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var int64_One: Int64 = %@!  // EXPECTED: regex expected expression here
    return 1
}
