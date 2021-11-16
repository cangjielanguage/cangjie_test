// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    let a = 10
    let a1: Int8 = 0b1010
    let a2: Int8 = 0o12
    let a3: Int8 = 0xa
    let b: Int16 = 10
    let c: Int32 = 10
    let d: Int64 = 10
    let e: UInt8 = 10
    let f: UInt16 = 10
    let g: UInt32 = 10
    let h: UInt64 = 10
    let i = 9

    if (a>9 && b>9 && c>9 && d>9 && e>9 && f>9 && g>9 && h>9 && a1>9 && a2>9 && a3>9 && a>i) {
    //if (a>9 && b>9 && c>9 && d>9 && e>9 && f>9 && g>9 && h>9 && a3>9 && a>i) {
        return 0
    }

    return 1
}