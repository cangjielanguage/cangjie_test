// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a = 2147483648
    let b: Int32 = a ** 2  // EXPECTED: regex invalid binary operator '\*\*' on type 'Int64' and 'Int32'

    return 0
}
