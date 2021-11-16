// EXEC: %compiler %cmp_opt %sync-link %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan test begin\nin main, count = 0\n
// ASSERT: scan-not Exception

from std import sync.*

var a: Int64 = 0
var b: Int64 = 0
var count: Int64 = 0

func main(): Int64 {
    let mtx1: Mutex = Mutex()
    let mtx2: Mutex = Mutex()
    spawn {
        mtx1.lock()
        b = b + 1
        while (a < 1) {
            sleep(0)
        }
        mtx2.lock()
        count = count + 1
        print("in thread1\n")
        mtx2.unlock()
        mtx1.unlock()
    }
    spawn {
        mtx2.lock()
        a = a + 1
        while (b < 1) {
            sleep(0)
        }
        mtx1.lock()
        count = count + 1
        print("in thread2\n")
        mtx1.unlock()
        mtx2.unlock()
    }
    while (a < 1 || b < 1) {
        sleep(0)
    }
    print("test begin\n")
    if (!mtx1.tryLock() && !mtx2.tryLock()) {
        print("in main, count = ${count}\n")
    }
    return 0
}
