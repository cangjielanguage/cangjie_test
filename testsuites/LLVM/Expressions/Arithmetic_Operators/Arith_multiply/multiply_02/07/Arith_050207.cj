// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a: Float16 = 63.9 * 255.9
    let b: Float32 = 63.9 * 255.9
    let c: Float64 = 63.9 * 255.9

    if (a != 16352.01) {
        return 1
    }

    if (b != 16352.01) {
        return 1
    }

    if (c != 16352.01) {
        return 1
    }

    return 0
}