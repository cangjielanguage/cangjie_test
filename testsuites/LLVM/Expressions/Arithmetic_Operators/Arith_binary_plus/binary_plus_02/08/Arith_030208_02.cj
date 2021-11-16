// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let b: Float32 = Float32(0x447fcccc) + Float32(0x477be0cc)
    let c: Float64 = Float64(0x408ff99980000000) + Float64(0x40ef7c1999999999)

    if (2348527104.0 - b > 0.001) {
        return 1
    }

    if (9331306365024049152.0 - c > 0.001) {
        return 2
    }

    return 0
}
