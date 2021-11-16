// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: UInt64 = 18446744073709551614 - 18446744073709551615 // EXPECTED: regex error.*overflow in 'Subtraction' calculation
    return 0
}
