// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

enum TimeUnit2<T> {
    Year(T) | Month(T) | Day
}

func main(){
    var a: Int32 = 1
    let timeT1 = TimeUnit2.Year(a)
    let timeT2 = TimeUnit2.Day // EXPECTED: regex error.*?generic type should be used with type argument
    let timeT3 = Year(a)
    let timeT4 = Day // EXPECTED: regex error.*?generic type should be used with type argument
    return 0
}

