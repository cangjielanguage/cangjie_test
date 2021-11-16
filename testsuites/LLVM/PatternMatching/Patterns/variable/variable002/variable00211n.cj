// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var i: Int32 = 91
    var result = match (i) {
        case good => good = 60 // EXPECTED: regex cannot assign to value which is an initialized 'let' constant

    }
    if (result == 60) {
        return 0
    }
    return 1
}


