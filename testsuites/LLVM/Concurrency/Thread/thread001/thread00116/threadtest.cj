// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan This is main\nThis is a new thread, sum = 3\nThis is a new thread, sum = 5\n

var sum: Int32 = 0

func add(a: Int32, b: Int32): Unit {
    sum = a + b
    print("This is a new thread, sum = ${sum}\n")
}

func main(): Int64 {
    print("This is main\n")
    let fut1: Future<Unit> = spawn {
        add(1, 2)
        return
        add(2, 3)
    }
    sleep(1000*1000*1000);
    if (sum != 3 ) {
        return 1
    }
    return 0
}
