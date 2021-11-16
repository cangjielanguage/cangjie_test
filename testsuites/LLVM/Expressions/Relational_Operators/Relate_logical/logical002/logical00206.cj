// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: Float16 = 1.2
    var t: Bool = true
    var f: Bool = false
    if (a && a) {  // EXPECTED: regex invalid binary operator '&&' on type 'Float16' and 'Float16'
        return 1
    }
    if (a && t) {  // EXPECTED: regex invalid binary operator '&&' on type 'Float16' and 'Bool'
        return 1
    }
    if (f && a) {  // EXPECTED: regex invalid binary operator '&&' on type 'Bool' and 'Float16'
        return 1
    }
    return 0 
}
