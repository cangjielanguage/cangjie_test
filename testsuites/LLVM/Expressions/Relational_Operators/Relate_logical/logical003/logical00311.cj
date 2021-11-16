// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a: String = "if"
    var t: Bool = true
    var f: Bool = false
    if (a ^^ a) {  // EXPECTED: regex-auto illegal symbol '^^'
        return 1
    }
    if (if (^^ t)) {  // EXPECTED: regex-auto illegal symbol '^^'
        return 1
    }
    if (f ^^ int) {  // EXPECTED: regex-auto illegal symbol '^^'
        return 1
    }
    return 0 
}
