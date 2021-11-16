// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    let a: Int8 = 10
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

    if (a==20 || b==20 || c==20 || d==20 || e==20 || f==20 || g==20 || h==20 || a1==20 || a2==20 || a3==20) {
        return 1
    }

    return 0
}