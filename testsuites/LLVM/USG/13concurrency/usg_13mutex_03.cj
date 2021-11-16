// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan count = 220
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

from std import sync.*

var count: Int64 = 0
let mtx = Mutex()

func foo() {
    mtx.lock()
    count += 10
    bar()
    mtx.unlock()
}

func bar() {
    mtx.lock()
    count += 100
    mtx.unlock()
}

func main(): Int64 {
    let fut = spawn {
        sleep(1 * 1000 * 1000) // sleep for 1ms.
        foo()
    }

    foo()
    fut.getResult()
    print("count = ${count}\n")
    return 0
}