// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
   let a: Int8 = 0b1111110 / 0b111
   let b: Int16 = 0b1111110 / 0b111
   let c: Int32 = 0b1111110 / 0b111
   let d: Int64 = 0b1111110 / 0b111

    if (a!=18) {
        return 1
    }

    if (b!=18) {
        return 1
    }

    if (c!=18) {
        return 1
    }

    if (d!=18) {
        return 1
    }

    let m: UInt8 = 0b11110000 / 0b1111
    let n: UInt16 = 0b11110000 / 0b1111
    let j: UInt32 = 0b11110000 / 0b1111
    let k: UInt64 = 0b11110000 / 0b1111

    if (m!=16) {
        return 1
    }

    if (n!=16) {
        return 1
    }

    if (j!=16) {
        return 1
    }

    if (k!=16) {
        return 1
    }

    return 0
}