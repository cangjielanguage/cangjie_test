// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int16 {
    var int16_var_One: Int16 = %@!  // EXPECTED: regex expected expression here
    return 1
}
