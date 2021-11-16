// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Int32 = 32768
    let b: UInt32 = 655365
    let c = a + b  // EXPECTED: regex invalid binary operator '\+' on type 'Int32' and 'UInt32'

    return 0
}
