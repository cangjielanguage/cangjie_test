// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a = 9
    let b = 10
    let c = 10

    a < b == c  // EXPECTED: regex invalid binary operator '==' on type 'Bool' and 'Int64'

    return 0
}
