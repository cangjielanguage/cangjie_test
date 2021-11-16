// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {

    let a = 10
    let a1: Int8 = 0b1010
    let a2: Int8 = 0o12
    let a3: Int8 = 0x_
    let b: Int16 = 10
    let c: Int32 = 10
    let d: Int64 = 10
    let e: UInt8 = 10
    let f: UInt16 = 10
    let g: UInt32 = 10
    let h: UInt64 = 10
    let i = 10

    if a<=10 && b<=10 && c<=10 && d<=10 && e<=10 && f<=10 && g<=10 && h<=10 && a1<=10 && a2<=10 && a3<=10 && a<=i {
        return 0
    }

    return 1
}