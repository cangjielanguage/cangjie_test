// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var int8_var_One: Int8 = %@!  // EXPECTED: regex expected expression here
    return 1
}
