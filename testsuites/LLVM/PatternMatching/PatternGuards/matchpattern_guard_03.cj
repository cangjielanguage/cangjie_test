// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation

func main(): Int64 {
    print(case01(1.0).toString())
    case02(1.0)
    return 0
}

func case01(x: Float32){
    let a: Float32 = 1.0
    let b: Float32 = 0.0
    var result: Int64 = match (TimeUnit.Year(x)) {
        case _  if ( false ) => 1
    }
    return result
}

func case02(x: Float32){
    let a: Float32 = 1.0
    let b: Float32 = 0.0
    var result: Int64 = match (TimeUnit.Year(x)) { // EXPECTED: regex all enum constructors must be covered in match
        case _  if ( x != 1.0 ) => 1
    }
    return result
}

enum TimeUnit {
    Year(Float32)
}
