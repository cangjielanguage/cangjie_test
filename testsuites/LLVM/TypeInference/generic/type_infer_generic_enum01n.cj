// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

enum TimeUnit1<T> {
    Year(T)
}

func run():Int64{
    var t0 = TimeUnit1<Int32>.Year(20)
    var t1:TimeUnit1<Int32> = TimeUnit1<Int64>.Year(20) // EXPECTED: regex no matching enum constructor 'Year' for given arguments
    var t2 = TimeUnit1<TimeUnit1<Int64>>.Year(t0) // EXPECTED: regex no matching enum constructor 'Year' for given arguments
    return 0
}
func main(): Int64 {
    return run()
}



