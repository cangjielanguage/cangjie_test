// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {

    let a = 10
    let a1: Int8 = 0b9010
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

    if a>=8 && b>=8 && c>=8 && d>=8 && e>=8 && f>=8 && g>=8 && h>=8 && a1>=8 && a2>=8 && a3>=8 && a>=i {
   
return 0
    }

    return 1
}