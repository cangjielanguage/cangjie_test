// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
   let a: Int8 = 4 * 32  // EXPECTED: regex overflow in 'Multiply' calculation

   return 0
}
