// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a: Int64 =-9223372036854775808
    let a1: Int64 = -a

    if (a1 == 9223372036854775808) {
         return 1
    }

    return 0
}