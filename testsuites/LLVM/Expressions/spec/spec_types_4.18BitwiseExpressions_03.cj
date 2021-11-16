// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    let x1 : UInt8 = 30 // 0b00011110
    let y1 = x1 >> 11  // EXPECTED: regex error.*?shift count overflow
    return 0
     
}


