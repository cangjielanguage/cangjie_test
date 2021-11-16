// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a: Float16 = Float16(0x7bff / 0x5bfa)
    let b: Float32 = Float32(0x477fdf33 / 0x437f51eb)
    let c: Float64 = Float64(0x40effbe666666666  / 0x406fea3d66666666)

    if (a - 256.553 > 0.001) {
        return 1
    }

    if (b - 256.553344 > 0.000001) {
        return 1
    }

    if (c - 256.5533448221839 > 0.0000000000001) {
        return 1
    }

    return 0
}