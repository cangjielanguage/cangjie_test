// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan invalid binary operator '**' on type 'Float16' and 'Int'
func main(): Int64 {
    let a: Float16 = 2.5 ** 0x59cc
    let b: Float32 = 0x40200000 * 11.6
    let c: Float64 = 2.5 * 0x4027333333333333

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
