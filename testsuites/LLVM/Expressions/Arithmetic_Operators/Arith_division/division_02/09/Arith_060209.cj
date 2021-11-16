// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a: Float16 = 65503.2 / Float16(0x5bfa)
    let b: Float32 = 65503.2 / Float32(0x437f51eb)
    let c: Float64 = Float64(0x40effbe666666666)  / 255.32


    if (a - 2.781250 > 0.001) {
        return 1
    }

    if (b - 0.000058 > 0.000001) {
        return 1
    }

    if (c - 18326944637475608.0 > 0.0000000000001) {
        return 1
    }

    return 0
}