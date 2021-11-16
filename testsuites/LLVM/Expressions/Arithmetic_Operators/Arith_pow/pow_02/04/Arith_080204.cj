// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
   let a: Int8 = 0x3 ** 0x4
   let b: Int16 = 0x2 ** 0xe
   let c: Int32 = 0x2 ** 0xe
   let d: Int64 = 0x2 ** 0xe

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

    let m: UInt8 = 0x3 ** 0x5
    let n: UInt16 = 0x2 ** 0xf
    let j: UInt32 = 0x2 ** 0xf
    let k: UInt64 = 0x2 ** 0xf

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