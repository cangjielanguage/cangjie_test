// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a: Float16 = 65503.2 / 255.32
    let b: Float32 = 65503.2 / 255.32
    let c: Float64 = 65503.2 / 255.32

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