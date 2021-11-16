// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var sum: Int32 = 0

func add(a: Int32, b: Int32): Int32 {
    print("This is a new thread\n")
    sum = a + b
    return sum
}

func main(): Int64 {
    print("This is main\n")
    // Create a thread.
    let fut: Future<Int32> = spawn { a: Int32, b: Int32 => add(a, b) } // EXPECTED: regex expected nonparametric lambda expression after 'spawn'
    if (sum != 3 ) {
        return 1
    }
    return 0
}
