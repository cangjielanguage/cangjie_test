// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {

    let a: UInt32 = 4294967294 - 4294967295 // EXPECTED: regex error.*overflow in 'Subtraction' calculation

    return 0
}
