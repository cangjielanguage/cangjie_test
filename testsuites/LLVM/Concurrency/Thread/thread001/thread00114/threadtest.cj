// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan This is a new thread\nin main thread, sum = 0\n

var sum: Int32 = 0

func add(a: Int32, b: Int32): Unit {
    sum = a + b
    print("sum = ${sum}\n")
}

func main(): Int64 {
    let fut1: Future<Unit> = spawn {
        print("This is a new thread\n")
        sleep(1000*1000*2000)
        add(1, 2)
    }
    sleep(1000*1000*1000)
    print("in main thread, sum = ${sum}\n")
    if (sum != 0 ) {
        return 1
    }
    return 0
}
