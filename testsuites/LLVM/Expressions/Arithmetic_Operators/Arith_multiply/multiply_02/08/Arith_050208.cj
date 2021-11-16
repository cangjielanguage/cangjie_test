// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a: Float16 = Float16(0x53fc) * Float16(0x5bff)
    let b: Float32 = Float32(0x427f9999) * Float32(0x437FE666)
    let c: Float64 = Float64(0x404ff33333333333) * Float64(0x406ffccccccccccc)

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