// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex illegal enum member in enum block

enum TimeUnit<T> {
    Year<T>(T) | Day(T)
}

func run(): Int64 {
    var year = TimeUnit<Int32, Int64, String>.Year<Int32>(2)
    return 0
}

func main(): Int64 {
    return run()
}
