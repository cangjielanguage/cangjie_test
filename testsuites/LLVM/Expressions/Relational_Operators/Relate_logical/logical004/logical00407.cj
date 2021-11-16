// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: String = "cc"
    var t: Bool = true
    var f: Bool = false
    if (a || a) {  // EXPECTED: regex invalid binary operator '||' on type 'Record-String' and 'Record-String'
        return 1
    }
    if (a || t) {  // EXPECTED: regex invalid binary operator '||' on type 'Record-String' and 'Bool'
        return 1
    }
    if (f || a) {  // EXPECTED: regex invalid binary operator '||' on type 'Bool' and 'Record-String'
        return 1
    }
    return 0 
}
