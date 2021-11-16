// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var t: Bool = true
    var f: Bool = false
    if (f |= f) {  // EXPECTED: regex type incompatible in this compound assignment expression
        return 1
    }
    if (f |== t) {  // EXPECTED: regex illegal left value
        return 1
    }
    return 0
}
