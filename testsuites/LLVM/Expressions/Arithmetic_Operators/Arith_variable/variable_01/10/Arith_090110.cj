// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Int32 = 32768
    let b: Float64 = 3.4e38 + 1
    let c = a + b  // EXPECTED: regex invalid binary operator '\+' on type 'Int32' and 'Float64'

    return 0
}
