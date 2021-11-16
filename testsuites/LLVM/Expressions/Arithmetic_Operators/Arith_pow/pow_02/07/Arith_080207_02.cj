// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let b: Float32 = 2.5 ** 11.6
    let c: Float64 = 2.5 ** 11.6

    if (b > 41314.66797 || b < 41314.66796) {
        return 1
    }

    if (c > 41314.65215415634 || c < 41314.65215415633) {
        return 2
    }

    return 0
}

