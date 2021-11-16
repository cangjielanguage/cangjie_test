// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex  type argument's number does not match type parameter's number

enum Time<T1,T2>{
    Day(T1) | Hour(T2)
}

func run(): Int64 {
    var time = Time<Int32>.Day("string")
    return 0
}

func main(): Int64 {
    return run()
}

