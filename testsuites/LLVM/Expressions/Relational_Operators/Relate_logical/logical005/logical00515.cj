// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var t: Bool = true
    var f: Bool = false
    if (f ^5 f) {  // EXPECTED: regex missing '\)' in if expression
        return 1
    }
    if (f ^a t) {  // EXPECTED: regex missing '\)' in if expression
        return 1
    }
    return 0
}
