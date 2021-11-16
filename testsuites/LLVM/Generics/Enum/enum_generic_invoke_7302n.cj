// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum Time<T>{
    Day(T) | Hour(T)
}

func run(): Int64 {
    var time = Time<Int32>.Day<Int32>(4) // EXPECTED: regex type arguments cannot appear after 'Day' when enum type 'Time' is given
    var time2 = Time<Int32>.Hour<Int64>(4) // EXPECTED: regex type arguments cannot appear after 'Hour' when enum type 'Time' is given
    return 0
}

func main(): Int64 {
    return run()
}
