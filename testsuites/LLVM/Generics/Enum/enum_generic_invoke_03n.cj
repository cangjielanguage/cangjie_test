// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

enum TimeUnit<T> {
    Year(T) | Month(T)
}

var i: Int64 = 4
var time = TimeUnit<Int32>.Year(i) // EXPECTED: regex no matching enum constructor 'Year' for given arguments
var res1: Int32 = match (time) {
    case Year(x) => 2020
    case Month(x) => 9
}

func run(): Int64 {
    if (res1 == 2020) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
