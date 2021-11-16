// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var time = Time.Day<Int32>(4) // EXPECTED: regex type arguments cannot appear after 'Day' when enum type 'Time' is given
    return 0
}

func main(): Int64 {
    return run()
}
