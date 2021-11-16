// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Bool = true
    let b: Int8 = 1

    if (a != b) {  // EXPECTED: regex invalid binary operator '!=' on type 'Bool' and 'Int8'
        return 0
    }
    return 1
}
