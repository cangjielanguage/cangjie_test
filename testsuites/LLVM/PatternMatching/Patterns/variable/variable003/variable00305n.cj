// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var result = match (50) {
        case 60 => "pass"
        case 70 | 80 => "good"
        case 30 @ 90 | 100 => "${30}, excellent!" // EXPECTED: regex expected '\=\>' after pattern in case body
        case other@ _ => other.toString()
    }
    if (result == "50") {
        return 0
    }
    return 1
}

