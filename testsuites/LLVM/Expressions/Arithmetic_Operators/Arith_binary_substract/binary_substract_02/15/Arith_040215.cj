// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
   let a: Int32 = -2147483647 - 2 // EXPECTED: regex error.*overflow in 'Subtraction' calculation

    return 0
}
