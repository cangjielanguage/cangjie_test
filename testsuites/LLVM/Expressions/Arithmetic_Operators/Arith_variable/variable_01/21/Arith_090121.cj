// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Int32 = 128
    let b: Int64 = 256
    let c = a * b  // EXPECTED: regex invalid binary operator '\*' on type 'Int32' and 'Int64'

    return 0
}
