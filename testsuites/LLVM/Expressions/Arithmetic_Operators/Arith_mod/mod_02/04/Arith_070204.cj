// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
   let a: Int8 = 0x7e % 0x11
   let b: Int16 = 0x7e % 0x11
   let c: Int32 = 0x7e % 0x11
   let d: Int64 = 0x7e % 0x11

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

    let m: UInt8 = 0xc0 % 0xf
    let n: UInt16 = 0xc0 % 0xf
    let j: UInt32 = 0xc0 % 0xf
    let k: UInt64 = 0xc0 % 0xf

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