// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
   let a: Int8 = 0b1111110 % 0b10001
   let b: Int16 = 0b1111110 % 0b10001
   let c: Int32 = 0b1111110 % 0b10001
   let d: Int64 = 0b1111110 % 0b10001

    if (a!=7) {
        return 1
    }

    if (b!=7) {
        return 1
    }

    if (c!=7) {
        return 1
    }

    if (d!=7) {
        return 1
    }

    let m: UInt8 = 0b11000000 % 0b1111
    let n: UInt16 = 0b11000000 % 0b1111
    let j: UInt32 = 0b11000000 % 0b1111
    let k: UInt64 = 0b11000000 % 0b1111

    if (m!=12) {
        return 1
    }

    if (n!=12) {
        return 1
    }

    if (j!=12) {
        return 1
    }

    if (k!=12) {
        return 1
    }

    return 0
}