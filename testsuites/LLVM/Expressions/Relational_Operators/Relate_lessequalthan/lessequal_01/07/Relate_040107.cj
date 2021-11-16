// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    let a: Int8 = 10
    let b: Int8 = 11

    if (a <=
     b) {
        return 0
    }

    return 1
}