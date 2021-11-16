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
    var howManyHours: Float32 = match (oneYear) { // EXPECTED: regex error.*?all enum constructors must be covered in match
        case Year(y) => y * 365.0 * 24.0 // matched
        case Month(y, m) => y * 365.0 * 24.0 + m * 30.0 * 24.0
    }
    return 0
}

