// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var t: Bool = true
    var f: Bool = false
    if (True ^^ false) {  // EXPECTED: regex-auto illegal symbol '^^'
        return 1
    }
    if (TRUE ^^ t) {  // EXPECTED: regex-auto illegal symbol '^^'
        return 1
    }
    return 0 
}
