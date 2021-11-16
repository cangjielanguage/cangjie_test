// EXEC: %compiler %cmp_opt %sync-link %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main\nthread sleeping\nthread end sleep\nin main, count = 2\nException occured: Exception RuntimeException ReleaseUnownedLockException Release a lock that current thread doesn't hold!

from std import sync.*

var count: Int64 = 0

func main(): Int64 {
    let mtx: Mutex = Mutex()
    let fut: Future<Unit> = spawn {
        mtx.lock()
        count = count + 1
        sleep(1000000)
        print("thread end sleep\n")
        count = count + 1
        mtx.unlock()
        mtx.unlock()
    }
    while (count < 1) {
        sleep(0)
    }
    print("in main\n")
    if (!mtx.tryLock()) {
        print("thread sleeping\n")
    }
    let opt: Result<Unit> = fut.getResult()
    if (mtx.tryLock()) {
        print("in main, count = ${count}\n")
    }
    match (opt) {
        case Ok(res) => print("OK\n")
        case Err(e) => print("Exception occured: ${e}")
    }
    return 0
}
