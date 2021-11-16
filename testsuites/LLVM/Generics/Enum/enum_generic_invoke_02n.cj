// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

enum TimeUnit<T> {
    Year(T) | Month(T)
}

var time = TimeUnit<Int32>.Year<Int32>(4) // EXPECTED: regex type arguments cannot appear after 'Year' when enum type 'TimeUnit' is given
var month = Month<Int32>(4)
var res1: Int32 = match (time) {
    case Year(x) => 2020
    case Month(x) => 9
}

var res2: Int32 = match (month) {
    case Year(x) => 2020
    case Month(x) => 9
}

func run(): Int64 {
    if (res1 == 2020 && res2 == 9) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
