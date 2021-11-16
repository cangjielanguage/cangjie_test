// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a: Int32 =-2147483648
    let a1: Int32 = -a

    if (a1 == 2147483648) {
         return 1
    }

    return 0
}