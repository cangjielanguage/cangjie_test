// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum TimeUnit T> {  // EXPECTED: regex expected '{' here
    Year(T)
}

func main(): Int32 {
    var i: Int32 = 2
    let time = TimeUnit<Int64>.Year(4)
    return 0
}

