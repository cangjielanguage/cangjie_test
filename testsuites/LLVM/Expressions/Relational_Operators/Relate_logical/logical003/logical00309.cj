// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: String = "~!@#$%^&*()_+"
    var t: Bool = true
    var f: Bool = false
    if (a ^^ a) {  // EXPECTED: regex-auto illegal symbol '^^'
        return 1
    }
    if (a ^^ t) {  // EXPECTED: regex-auto illegal symbol '^^'
        return 1
    }
    if (f ^^ a) {  // EXPECTED: regex-auto illegal symbol '^^'
        return 1
    }
    return 0 
}
