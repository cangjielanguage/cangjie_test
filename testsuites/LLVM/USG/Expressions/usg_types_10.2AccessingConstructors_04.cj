// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

enum TimeUnit1 {
    Year(Int32) | Month(Int32) | Day
}

enum TimeUnit2<T> {
    Year(T) | Month(T) | Day
}
func main(){
    var a: Int32 = 1
    let time1 = Year(a)  // EXPECTED: regex error.*?find multiple constructor 'Year' of enum declaration
    var b: Int64 = 1
    let time4 = Year(b) // ok, 存在唯一TimeUnit2.Year

    return 0
}

