// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var t: Bool = true
    var f: Bool = false
    if (t || False) {  // EXPECTED: regex undeclared identifier 'False'
        return 1
    }
    if (FALSE || f) {  // EXPECTED: regex undeclared identifier 'FALSE'
        return 1
    }
    return 0 
}
