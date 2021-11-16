// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1| compare %f
// ASSERT: scan Exception RuntimeException ArithmeticException OverflowException neg
func main(): Int64 {
    let a: Int8 =-128
    let a1: Int8 = -a

    if (a1 == 127) {
         return 1
    }

    return 0
}
