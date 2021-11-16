// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Bool = true
    let b: Bool = false

    if (a < b) {  // EXPECTED: regex invalid binary operator '<' on type 'Bool' and 'Bool'
        return 1
    }
    return 0
}
