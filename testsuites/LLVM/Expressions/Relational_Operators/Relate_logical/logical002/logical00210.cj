// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var t: Bool = true
    var f: Bool = false
    if (&&) {  // EXPECTED: regex error
        return 1
    }
    if (&&t) {  // EXPECTED: regex error
        return 1
    }
    if (f&&) {  // EXPECTED: regex error
        return 1
    }
    return 0
}
