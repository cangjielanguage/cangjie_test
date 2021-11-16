// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a: Int16 =-32768
    let a1: Int16 = -a

    if (a1 == 32768) {
         return 1
    }

    return 0
}