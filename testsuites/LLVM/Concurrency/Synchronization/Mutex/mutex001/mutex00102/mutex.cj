// EXEC: %compiler %cmp_opt %sync-link %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main\nthread end sleep\ncount = 2\n
// ASSERT: scan-not Exception

from std import sync.*

var count: Int64 = 0

func main(): Int64 {
    let mtx: Mutex = Mutex()
    spawn {
        mtx.lock()
        count = count + 1
        sleep(1000000)
        print("thread end sleep\n")
        count = count + 1
        mtx.unlock()
    }
    while (count < 1) {
        sleep(0)
    }
    print("in main\n")
    mtx.lock()
    print("count = ${count}\n")
    mtx.unlock()
    return 0
}
