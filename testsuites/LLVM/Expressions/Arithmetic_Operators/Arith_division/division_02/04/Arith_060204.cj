// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
   let a: Int8 = 0x7e / 0x7
   let b: Int16 = 0x7e / 0x7
   let c: Int32 = 0x7e / 0x7
   let d: Int64 = 0x7e / 0x7

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

    let m: UInt8 = 0xf0 / 0xf
    let n: UInt16 = 0xf0 / 0xf
    let j: UInt32 = 0xf0 / 0xf
    let k: UInt64 = 0xf0 / 0xf

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
