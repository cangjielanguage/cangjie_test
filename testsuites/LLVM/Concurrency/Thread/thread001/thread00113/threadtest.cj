// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan This is a new thread\nsum = 3\nin main thread, sum = 3\n

var sum: Int32 = 0

func add(a: Int32, b: Int32): Unit {
    sum = a + b
    print("sum = ${sum}\n")
}

func main(): Int64 {
    let fut: Future<Unit> = spawn {
        print("This is a new thread\n")
        sleep(-1)
        add(1, 2)
    }
    fut.getResult()
    print("in main thread, sum = ${sum}\n")
    if (sum != 3 ) {
        return 1
    }
    return 0
}
