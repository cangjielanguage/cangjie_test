// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var result = match (50) {
        case 60 => "pass"
        case 70 | 80 => "good"
        case other@ _ => other=40; "fail"   // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
    }                                       // Note: If match expression's cases type mismatch, other error messages will be shadowed. This will be fixed later when the implementation completely migrating from nullptr to INVALID_TY
    if (result == "50") {
        return 0
    }
    return 1
}

