// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: UInt32 = 2
    let b = a ** Int64(128)   // EXPECTED: regex invalid binary operator '\*\*' on type 'UInt32' and 'Int64'

    return 0
}