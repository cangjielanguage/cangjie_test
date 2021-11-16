// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation

func main():Int64 {
    case01()
    return 0
}

func case01(){
    let intList: List<TimeUnit2> = [Year(1), Month(2,2)]
    var a: Float32 = 0
    for (Month(x,y) in intList) { // EXPECTED: regex error.*?the pattern in for-in expression must be irrefutable
        a = x
    }
    a
}

enum TimeUnit2 {
    Year(Float32)
    | Month(Float32, Float32)
}
