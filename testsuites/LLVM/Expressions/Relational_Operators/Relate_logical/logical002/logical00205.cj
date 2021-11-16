// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: Int8 = 10
    var t: Bool = true
    var f: Bool = false
    if (a && a) {  // EXPECTED: regex invalid binary operator '&&' on type 'Int8' and 'Int8'
        return 1
    }
    if (a && t) {  // EXPECTED: regex invalid binary operator '&&' on type 'Int8' and 'Bool'
        return 1
    }
    if (f && a) {  // EXPECTED: regex invalid binary operator '&&' on type 'Bool' and 'Int8'
        return 1
    }
    return 0
}
