// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var sum: Int32 = 0

func main(): Int64 {
    print("This is main\n")
    let fut1: Future<Int32> = spawn {
        sum = sum + 1
        break // EXPECTED: regex 'break' or 'continue' must be in a loop
        print("This is a new thread, sum = ${sum}\n")
        return sum
    }
    sleep(1000*1000*1000);
    if (sum != 10 ) {
        return 1
    }
    return 0
}
