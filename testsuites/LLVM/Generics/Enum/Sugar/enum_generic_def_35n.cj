// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex 'Year' is already exist in enum 'TimeUnit'

enum TimeUnit<T1, T2, T3> {
    Year(T1, T2) | Year(T2, T3)
}

func run(): Int64 {
    var year1 = TimeUnit.Year(1,2)
    var year2 = TimeUnit.Year(1,"2")

    var res1: String = match (year1) {
        case Year(x,y) => x.toString() + y.toString()
        case Year(y,z) => y.toString() + z
    }
    return 0
}

func main(): Int64 {
    return run()
}
