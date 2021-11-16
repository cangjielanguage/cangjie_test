// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a: Int8 = 0o37 - 0o177
    let b: Int16 = 0o37 - 0o177
    let c: Int32 = 0o37 - 0o177
    let d: Int64 = 0o37 - 0o177

    if (a!=-96) {
        return 1
    }

    if (b!=-96) {
        return 1
    }

    if (c!=-96) {
        return 1
    }

    if (d!=-96) {
        return 1
    }

    let m: UInt8 = 0o377 - 0o200
    let n: UInt16 = 0o377 - 0o200
    let j: UInt32 = 0o377 - 0o200
    let k: UInt64 = 0o377 - 0o200

    if (m!=127) {
        return 1
    }

    if (n!=127) {
        return 1
    }

    if (j!=127) {
        return 1
    }

    if (k!=127) {
        return 1
    }

    return 0
}