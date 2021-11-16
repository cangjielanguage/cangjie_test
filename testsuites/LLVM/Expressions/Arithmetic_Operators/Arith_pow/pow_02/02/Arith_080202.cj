// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
   let a: Int8 = 0b11 ** 0b100
   let b: Int16 = 0b10 ** 0b1110
   let c: Int32 = 0b10 ** 0b1110
   let d: Int64 = 0b10 ** 0b1110

    if (a!=81) {
        return 1
    }

    if (b!=16384) {
        return 1
    }

    if (c!=16384) {
        return 1
    }

    if (d!=16384) {
        return 1
    }

    let m: UInt8 = 0b11 ** 0b101
    let n: UInt16 = 0b10 ** 0b1111
    let j: UInt32 = 0b10 ** 0b1111
    let k: UInt64 = 0b10 ** 0b1111

    if (m!=243) {
        return 1
    }

    if (n!=32768) {
        return 1
    }

    if (j!=32768) {
        return 1
    }

    if (k!=32768) {
        return 1
    }

    return 0
}