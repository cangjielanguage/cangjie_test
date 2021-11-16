// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a: Float32 = 10.0
    let b: Bool = true

    if (a != b) {  // EXPECTED: regex invalid binary operator '!=' on type 'Float32' and 'Bool'
        return 0
    }
    return 1
}
