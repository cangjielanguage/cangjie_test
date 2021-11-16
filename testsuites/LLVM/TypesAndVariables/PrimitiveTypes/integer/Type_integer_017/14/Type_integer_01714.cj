// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var uint64_One: UInt64 = Int32  // EXPECTED: regex expected expression here
    return 1
}
