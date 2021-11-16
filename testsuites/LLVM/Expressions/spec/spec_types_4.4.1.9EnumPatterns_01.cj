// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

enum TimeUnit {
    | Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}

func main(){
    let oneYear = TimeUnit.Year(1.0)
    var howManyHours: Float32 = match (oneYear) {
        case Year(y) => y * 365 * 24 // matched
        case Month(y, m) => y * 365 * 24 + m * 30 * 24
        case Day(y, m, d) => y * 365 * 24 + m * 30 * 24 + d * 24
        case Hour(y, m, d, h) => y * 365 * 24 + m * 30 * 24 + d * 24 + h
    }
    let twoYear = TimeUnit.Year(2.0)
    var howManyYears: Float32 = match (twoYear) {
        case Year(y) | Month(y, m) => y  // EXPECTED: regex error.*?different name of variables are introduced in enum pattern
        case Year(y) | Month(x, _) => y  // EXPECTED: regex error.*?different name of variables are introduced in enum pattern
        case Year(y) | Month(y, _) => y
   //     ...
    }
    return 0
}

