// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
   let a: Int8 = 0b111 * 0b10000
   let b: Int16 = 0b11111 * 0b1100000
   let c: Int32 = 0b11111 * 0b1100000
   let d: Int64 = 0b11111 * 0b1100000

    if (a!=112) {
        return 1
    }

    if (b!=2976) {
        return 1
    }

    if (c!=2976) {
        return 1
    }

    if (d!=2976) {
        return 1
    }

    let m: UInt8 = 0b1111 * 0b10000
    let n: UInt16 = 0b111111 * 0b11000000
    let j: UInt32 = 0b111111 * 0b11000000
    let k: UInt64 = 0b111111 * 0b11000000

    if (m!=240) {
        return 1
    }

    if (n!=12096) {
        return 1
    }

    if (j!=12096) {
        return 1
    }

    if (k!=12096) {
        return 1
    }

    return 0
}