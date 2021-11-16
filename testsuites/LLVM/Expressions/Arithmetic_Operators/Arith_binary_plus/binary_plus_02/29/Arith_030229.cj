// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a = 2020 + true // EXPECTED: regex invalid binary operator '\+' on type 'Int' and 'Bool'

    return 0
}
