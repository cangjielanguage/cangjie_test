// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    let x: UInt8 = 30
    let a = x >> 11 // EXPECTED: regex shift count overflow
    return 0
}