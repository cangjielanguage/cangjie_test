// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var t: Bool = true
    var f: Bool = false
    if (f | f) {  // EXPECTED: regex invalid binary operator '|' on type 'Bool' and 'Bool'
        return 1
    }
    if (f | t) {  // EXPECTED: regex invalid binary operator '|' on type 'Bool' and 'Bool'
        return 1
    }
    return 0
}
