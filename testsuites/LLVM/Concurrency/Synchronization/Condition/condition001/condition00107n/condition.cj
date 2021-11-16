// EXEC: %compiler %cmp_opt %sync-link %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ReleaseUnownedLockException

from std import sync.*

var count: Int64 = 0

func main(): Int64 {
    let mtx: Mutex = Mutex()
    let cond: Condition = mtx.newCondition()
    mtx.lock()
    let fut = spawn {
        print("in thread\n")
        cond.wait()
        count = count + 1
    }
    sleep(1000000)
    print("in main\n")
    mtx.unlock()
    sleep(10000000)
    match (fut.getResult()) {
        case Ok(v) => v
        case Err(e) => throw e
    }
    if (mtx.tryLock()) {
        print("in main, count = ${count}\n")
    }
    return 0
}
