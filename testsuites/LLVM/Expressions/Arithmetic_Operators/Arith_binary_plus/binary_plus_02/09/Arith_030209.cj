// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a: Float16 = 1023.2 + Float16(0x7bdf)
    let b: Float32 = Float32(0x447fcccc) + 65480.8
    let c: Float64 = 1023.2 + Float64(0x40ef7c1999999999)

    if (a - 65504.0 < 0.001) {
        return 0
    }

    if (b - 65504.0 < 0.000001) {
        return 0
    }

    if (c - 65504.0 < 0.000000000001) {
        return 0
    }

    return 0
}