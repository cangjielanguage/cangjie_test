// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
   let a: Int8 = 0x7 * 0x10
   let b: Int16 = 0x1f * 0x60
   let c: Int32 = 0x1f * 0x60
   let d: Int64 = 0x1f * 0x60

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

    let m: UInt8 = 0xf * 0x10
    let n: UInt16 = 0x3f * 0xC0
    let j: UInt32 = 0x3f * 0xC0
    let k: UInt64 = 0x3f * 0xC0

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