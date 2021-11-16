// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation

func main():Int64 {
    case01()
    return 0
}

func case01(){
    let intList: List<TimeUnit> = [Year(1), Year(2)]
    var a: Float32 = 0
    for Year(in (Float32(1),Float32(2))) // EXPECTED: regex-auto missing '(' in forIn expression
     in intList {
        a = a + a
    }
    a
}

enum TimeUnit {
    Year(Float32)
}
