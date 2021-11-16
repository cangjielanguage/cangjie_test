// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
   let a: Int8 = 0o3 ** 0o4
   let b: Int16 = 0o2 ** 0o16
   let c: Int32 = 0o2 ** 0o16
   let d: Int64 = 0o2 ** 0o16

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

    let m: UInt8 = 0o3 ** 0o5
    let n: UInt16 = 0o2 ** 0o17
    let j: UInt32 = 0o2 ** 0o17
    let k: UInt64 = 0o2 ** 0o17

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