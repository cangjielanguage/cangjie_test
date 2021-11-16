// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
   let a: Int8 = -32 - 97 // EXPECTED: regex error.*overflow in 'Subtraction' calculation
    return 0
}
