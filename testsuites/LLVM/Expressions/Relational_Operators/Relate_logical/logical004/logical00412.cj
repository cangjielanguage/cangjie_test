// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var t: Bool = true
    var f: Bool = false
    if (True || false) {  // EXPECTED: regex undeclared identifier 'True'
        return 1
    }
    if (TRUE || t) {  // EXPECTED: regex undeclared identifier 'TRUE'
        return 1
    }
    return 0 
}
