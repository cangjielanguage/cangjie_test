// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    let a: Int8 = 10
    let a1: Int8 = 0b1100
    let a2: Int8 = 0o14
    let a3: Int8 = 0xc
    let b: Int16 = 10
    let c: Int32 = 10
    let d: Int64 = 10
    let e: UInt8 = 10
    let f: UInt16 = 10
    let g: UInt32 = 10
    let h: UInt64 = 10

    if (a!=11 && b!=11 && c!=11 && d!=11 && e!=11 && f!=11 && g!=11 && h!=11 && a1!=11 && a2!=11 && a3!=11 && a!=a3) {
        return 0
    }

    return 1
}