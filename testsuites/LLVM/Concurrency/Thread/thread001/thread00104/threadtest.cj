// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan This is main\nThis is a new thread, sum = 7\nThis is a new thread, sum = 10\n

var sum: Int32 = 0

func add(a: Int32, b: Int32): Int32 {
    sum = sum + a + b
    print("This is a new thread, sum = ${sum}\n")
    return sum
}

func main(): Int64 {
    print("This is main\n")
    // Create a thread.
    let fut1: Future<Int32> = spawn {
        sleep(1000*1000*300)
        add(1, 2)
    }
    let fut2: Future<Int32> = spawn {
        sleep(1000*1000*100)
        add(3, 4)
    }
    sleep(1000*1000*1000)
    if (sum != 10 ) {
        return 2
    }
    return 0
}
