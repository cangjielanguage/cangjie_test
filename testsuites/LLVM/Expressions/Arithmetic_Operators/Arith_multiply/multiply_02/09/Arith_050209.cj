// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a: Float16 = 63.9 * Float16(0x5bff)
    let b: Float32 = Float32(0x427f9999) * 255.9
    let c: Float64 = 63.9 * Float64(0x406ffccccccccccc)

    if (a - 16352.01 < 0.0001) {
        return 1
    }

    if (b - 16352.01 < 0.000001) {
        return 1
    }

    if (c - 16352.01 < 0.000000000000001) {
        return 1
    }

    return 0
}