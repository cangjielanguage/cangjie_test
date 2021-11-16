// EXEC: %compiler %cmp_opt %sync-link %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Exception RuntimeException ReleaseUnownedLockException Release a lock that current thread doesn't hold!

from std import sync.*

var count: Int64 = 0

func main(): Int64 {
    let mtx: Mutex = Mutex()
    let cond: Condition = mtx.newCondition()
    cond.wait()
    print("in main\n")
    return 0
}
