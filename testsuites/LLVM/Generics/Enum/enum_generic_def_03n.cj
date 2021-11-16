// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum TimeUnit<T { // EXPECTED: regex expected '>' in the end of collection or tuple type or type parameters
    Year(T)
}

func main(): Int64 {
    let time = TimeUnit<Int64>.Year(3)
    return 0
}

