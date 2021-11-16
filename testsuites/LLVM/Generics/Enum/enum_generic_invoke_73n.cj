// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum Time<T>{
    Day(T) | Hour(T) | Nil
}

func run(): Int64 {
    var time = Time<Int32>.Day(4)
    var time2 = Hour(4)
    var invalid = Nil // EXPECTED: regex generic type should be used with type argument
    return 0
}

func main(): Int64 {
    return run()
}
