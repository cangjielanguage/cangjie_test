// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    let p: Int8 = -30
    let q = p << 2  // q = -120
    let r = p >> 2  // r = -8
    let r2 = p >> -2  // EXPECTED: regex error.*?shift count is negative
    let x: UInt8 = 30
    let b = x << 3  // b = 240
    let b2 = x >> 1  // b2 = 15
    return 0
     
}


