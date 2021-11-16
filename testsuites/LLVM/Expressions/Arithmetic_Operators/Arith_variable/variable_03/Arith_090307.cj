// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: UInt32 = 2147483647
    let b = a + UInt64(4294967296) // EXPECTED: regex invalid binary operator '\+' on type 'UInt32' and 'UInt64'

    return 0
}