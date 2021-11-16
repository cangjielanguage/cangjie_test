// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var sum: Int32 = 0

func add(a: Int32, b: Int32): Int32 {
    sum = a + b
    print("This is a new thread, sum = ${sum}\n")
    return sum
}

func main(): Int64 {
    print("This is main\n")
    let fut1: Future<Int32> = spawn {
        add(1, 2)
        return true // EXPECTED: regex type of return expression is incompatible with return type
    }
    sleep(1000*1000*1000);
    if (sum != 3 ) {
        return 1
    }
    return 0
}
