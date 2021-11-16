// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let b: Float32 = Float32(0x447fcccc - 0x477be0cc)
    let c: Float64 = -1023.2 - Float64(0x40ef7c1999999999)

    if (b - (-50074624.0) > 0.1) {
        return 1
    }

    if (c - (-4679094987254242304.0) > 0.1) {
        return 2
    }

    return 0
}
