// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var uint16_One: UInt16 = %@!  // EXPECTED: regex expected expression here
    return 1
}
