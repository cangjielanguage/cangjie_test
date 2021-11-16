// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a: Int8 = 0o7 + 0o20
    let b: Int16 = 0o37 * 0o140
    let c: Int32 = 0o37 * 0o140
    let d: Int64 = 0o37 * 0o140

    if (a!=23) {
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

    let m: UInt8 = 0o17 * 0o20
    let n: UInt16 = 0o77 * 0o300
    let j: UInt32 = 0o77 * 0o300
    let k: UInt64 = 0o77 * 0o300

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
