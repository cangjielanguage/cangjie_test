// EXEC: %compiler %cmp_opt %sync-link %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main\nthread sleeping\nthread end sleep\nin main, count = 3\n
// ASSERT: scan-not Exception

from std import sync.*

var count: Int64 = 0

func main(): Int64 {
    let mtx: Mutex = Mutex()
    let fut: Future<Unit> = spawn {
        mtx.lock()
        count = count + 1
        while (count < 2) {
            sleep(0)
        }
        print("thread end sleep\n")
        count = count + 1
        mtx.unlock()
    }
    while (count < 1) {
        sleep(0)
    }
    print("in main\n")
    if (!mtx.tryLock(-1000)) {
        print("thread sleeping\n")
    }
    count = count + 1
    fut.getResult()
    if (mtx.tryLock(0)) {
        print("in main, count = ${count}\n")
    }
    return 0
}
