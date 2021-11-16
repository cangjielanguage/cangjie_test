// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let x: UInt8 = 30
    let a = 30 >> 1.1415926 // EXPECTED: regex invalid binary operator '>>' on type 'Int' and 'Float'
    return 0
}
