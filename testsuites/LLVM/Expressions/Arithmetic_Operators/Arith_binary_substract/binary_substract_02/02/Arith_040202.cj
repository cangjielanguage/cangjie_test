// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
   let a: Int8 = 0b11111 - 0b1111111
   let b: Int16 = 0b11111 - 0b1111111
   let c: Int32 = 0b11111 - 0b1111111
   let d: Int64 = 0b11111 - 0b1111111

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

    let m: UInt8 = 0b11111111 - 0b10000000
    let n: UInt16 = 0b11111111 - 0b10000000
    let j: UInt32 = 0b11111111 - 0b10000000
    let k: UInt64 = 0b11111111 - 0b10000000

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


    return 0
}