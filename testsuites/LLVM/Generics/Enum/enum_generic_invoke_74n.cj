// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum Time<T>{
    Day(T) | Hour(T)
}

func run(): Int64 {
    var time = Time<Int32>.Day("string") // EXPECTED: regex no matching enum constructor 'Day' for given arguments
    return 0
}

func main(): Int64 {
    return run()
}
