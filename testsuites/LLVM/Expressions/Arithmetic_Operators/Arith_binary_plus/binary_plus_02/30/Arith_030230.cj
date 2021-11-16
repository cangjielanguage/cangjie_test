// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a = '1' + true // EXPECTED: regex invalid binary operator '\+' on type 'Char' and 'Bool'

    return 0
}
