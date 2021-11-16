// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Bool = true
    let b: Char = '1'

    if (a != b) {  // EXPECTED: regex invalid binary operator '!=' on type 'Bool' and 'Char'
        return 0
    }
    return 1
}
