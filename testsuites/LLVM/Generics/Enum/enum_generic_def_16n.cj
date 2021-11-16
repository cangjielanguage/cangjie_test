// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum TimeUnit<T>
    where T <:  {  // EXPECTED: regex illegal upper bound
    Year(T)
}

func main(): Int64 {
    var i1: Int32 = 4
    var time = TimeUnit<Int32>.Year(i1)
    return 0
}