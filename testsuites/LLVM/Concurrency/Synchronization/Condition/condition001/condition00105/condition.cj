// EXEC: %compiler %cmp_opt %sync-link %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main\nin thread\nin thread\nin main, count = 2\n
// ASSERT: scan-not Exception

from std import sync.*

var count: Int64 = 0

func main(): Int64 {
    let mtx: Mutex = Mutex()
    let cond: Condition = mtx.newCondition()
    mtx.lock()
    spawn {
        mtx.lock()
        print("in thread\n")
        cond.wait()
        count = count + 1
        mtx.unlock()
    }
    spawn {
        mtx.lock()
        print("in thread\n")
        cond.wait()
        count = count + 1
        mtx.unlock()
    }
    sleep(1000000)
    print("in main\n")
    mtx.unlock()
    sleep(10000000)
    cond.notifyAll()
    while (count < 1) {
        sleep(0)
    }
    sleep(1000000000)
    if (mtx.tryLock()) {
        print("in main, count = ${count}\n")
    }
    return 0
}
