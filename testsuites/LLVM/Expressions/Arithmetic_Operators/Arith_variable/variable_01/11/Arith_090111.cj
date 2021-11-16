// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Int8 = 127
    let b: Int64 = 2147483648
    let c = a + b  // EXPECTED: regex invalid binary operator '\+' on type 'Int8' and 'Int64'

    return 0
}
