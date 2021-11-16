// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {

   let a: Int64 = -9223372036854775807 - 2 // EXPECTED: regex error.*overflow in 'Subtraction' calculation

    return 0
}
