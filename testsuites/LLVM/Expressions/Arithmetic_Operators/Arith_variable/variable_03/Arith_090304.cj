// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Int64 = 2147483648
    let b = a + UInt64(9223372036854775808)  // EXPECTED: regex invalid binary operator '\+' on type 'Int64' and 'UInt64'

    return 0
}
