// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a: Float16 = 2.5 ** 11.6
    let b: Float32 = 2.5 ** 11.6
    let c: Float64 = 2.5 ** 11.6
    
    if (a != 41376.000000) {
        return 1
    }

    if (b != 41314.667969) {
        return 1
    }

    if (c != 41314.652154156334) {
        return 1
    }

    return 0
}
