// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: UInt8 = 128
    let b = a + UInt16(256) // EXPECTED: regex invalid binary operator '\+' on type 'UInt8' and 'UInt16'

    return 0
}