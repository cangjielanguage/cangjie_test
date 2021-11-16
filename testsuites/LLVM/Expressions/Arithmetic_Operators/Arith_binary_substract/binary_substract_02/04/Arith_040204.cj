// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a: Int8 = 0x1F - 0x7F
    let b: Int16 = 0x1F - 0x7F
    let c: Int32 = 0x1F - 0x7F
    let d: Int64 = 0x1F - 0x7F

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

    let m: UInt8 = 0xFF - 0x80
    let n: UInt16 = 0xFF - 0x80
    let j: UInt32 = 0xFF - 0x80
    let k: UInt64 = 0xFF - 0x80

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