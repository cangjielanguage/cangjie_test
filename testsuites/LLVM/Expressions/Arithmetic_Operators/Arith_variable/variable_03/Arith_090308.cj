// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Int32 = 32798
    let b = a + 214748.98 // EXPECTED: regex invalid binary operator '\+' on type 'Int32' and 'Float'

    return 0
}