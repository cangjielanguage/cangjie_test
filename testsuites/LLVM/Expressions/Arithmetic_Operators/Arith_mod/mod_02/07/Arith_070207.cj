// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a: Float16 = 65503.2 % 255.32
    let b: Float32 = 65503.2 % 255.32
    let c: Float64 = 65503.2 % 255.32

    if (a - 141.28 > 0.001) {
        return 1
    }

    if (b - 141.28 > 0.000001) {
        return 1
    }

    if (c - 141.28 > 0.0000000000001) {
        return 1
    }

    return 0
}