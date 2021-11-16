// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var i: Int32 = 91
    var result = match (i) {
        case 90 | other  => other.toString() // EXPECTED: regex expected constant literal here
    }
    if (result == "91") {
        return 0
    }
    return 1
}


