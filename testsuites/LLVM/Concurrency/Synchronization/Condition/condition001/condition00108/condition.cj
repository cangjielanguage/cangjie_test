// EXEC: %compiler %cmp_opt %sync-link %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main\nin thread\nin main, count = 1\n
// ASSERT: scan-not Exception

from std import sync.*

var count: Int64 = 0
var globalFlag = 0
func main(): Int64 {
    let mtx: Mutex = Mutex()
    let cond: Condition = mtx.newCondition()
    mtx.lock()
    spawn {
        mtx.lock()
        mtx.lock()
        print("in thread\n")
        while(globalFlag == 0) {
            cond.wait()
        }
        count = count + 1
        mtx.unlock()
    }
    sleep(1000000)
    print("in main\n")
    mtx.unlock()
    sleep(10000000)
    mtx.lock()
    globalFlag = 1
    mtx.unlock()
    cond.notify()
    while (count < 1) {
        sleep(0)
    }
    sleep(10000000)
    if (!mtx.tryLock()) {
        print("in main, count = ${count}\n")
    }
    return 0
}
