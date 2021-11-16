// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
   let a: Int8 = 7 * 16
   let b: Int16 = 31 * 96
   let c: Int32 = 31 * 96
   let d: Int64 = 31 * 96

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

    let m: UInt8 = 15 * 16
    let n: UInt16 = 63 * 192
    let j: UInt32 = 63 * 192
    let k: UInt64 = 63 * 192

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