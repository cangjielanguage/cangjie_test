// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan overflow in 'Power' calculation
func main(): Int64 {
    let a: Float16 = 0x4100 ** 0x59cc
    let b: Float32 = 0x40200000 ** 0x41399999
    let c: Float64 = 0x4004000000000000 ** 0x4027333333333333

    if (a - 41314 > 1) {
        return 1
    }

    if (a - 41314.6 > 0.1) {
        return 1
    }

    if (c - 41314.652154156 > 0.000000001) {
        return 1
    }

    return 0
}
