// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
   let a: Int8 = 0o176 % 0o21
   let b: Int16 = 0o176 % 0o21
   let c: Int32 = 0o176 % 0o21
   let d: Int64 = 0o176 % 0o21

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

    let m: UInt8 = 0o300 % 0o17
    let n: UInt16 = 0o300 % 0o17
    let j: UInt32 = 0o300 % 0o17
    let k: UInt64 = 0o300 % 0o17

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