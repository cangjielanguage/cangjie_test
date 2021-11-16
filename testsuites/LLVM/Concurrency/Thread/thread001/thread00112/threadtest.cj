// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan sum = 0

var sum: Int32 = 0

func add(): Unit {
    sum = sum + 1
}

func main(): Int64 {
    let fut: Future<Unit> = spawn {
        sleep(9223372036854775807)
        add()
    }
    sleep(1000*1000*1000)
    print("sum = ${sum}")
    return 0
}
