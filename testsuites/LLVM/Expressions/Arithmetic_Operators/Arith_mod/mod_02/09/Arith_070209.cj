// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a: Float16 = 65503.2 % Float16(0x5bfa)
    let b: Float32 = 65503.2 % Float32(0x437f51eb)
    let c: Float64 = Float64(0x40effbe666666666)  % 255.32

    if (a - 18400.0 > 0.01) {
        return 1
    }

    if (b - 65503.199219 > 0.000001) {
        return 1
    }

    if (c - 17.771943 > 0.000001) {
        return 1
    }

    return 0
}