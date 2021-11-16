// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a: Float16 = 1023.2 + 64480.8
    let b: Float32 = 1023.2 + 64480.8
    let c: Float64 = 1023.2 + 64480.8

    if (65504.0 - a > 0.001) {
        return 1
    }

    if (65504.0 - b > 0.000001) {
        return 1
    }

    if (65504.0 - c > 0.000000000001) {
        return 1
    }

    return 0
}
