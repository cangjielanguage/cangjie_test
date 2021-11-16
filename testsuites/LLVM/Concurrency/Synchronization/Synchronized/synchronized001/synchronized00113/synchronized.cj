// EXEC: %compiler %cmp_opt %sync-link %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main, count = 0\nin main, count = 10\n
// ASSERT: scan-not Exception

from std import sync.*

var count: Int64 = 0
var mtx: Mutex = Mutex()
var cond: Condition = mtx.newCondition()

func main(): Int64 {
    var i: Int64 = 0
    while (i < 10) {
        i = i + 1
        spawn {
            synchronized(mtx) {
                cond.wait()
                count = count + 1
            }
        }
    }
    sleep(10000000)
    print("in main, count = ${count}\n")
    cond.notifyAll()
    while (count < 10) {
        sleep(0)
    }
    print("in main, count = ${count}\n")
    return 0
}
