// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var sum: Int32 = 0

func add(): Unit {
    sum = sum + 1
}

func main(): Int64 {
    
    print("This is main\n")
    let fut1: Future<Unit> = spawn {
        let time1: Int32 = 1000000000
        sleep(time1) // EXPECTED: regex argument is mismatched with parameter type 'Int64'
        add()
    }
    let time2: UInt64 = 2000000000
    sleep(time2); // EXPECTED: regex argument is mismatched with parameter type 'Int64'
    if (sum != 1 ) {
        return 1
    }
    return 0
}
