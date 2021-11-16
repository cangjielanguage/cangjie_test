// EXEC: %compiler %cmp_opt %sync-link %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in thread\nin main, count = 1\n
// ASSERT: scan-not Exception

from std import sync.*

var count: Int64 = 0

func main(): Int64 {
    let mtx: Mutex = Mutex()
    var i: Int64 = 0
    while (i < 10000) {
        i = i + 1
        spawn {
            mtx.lock()
            count = count + 1
            print("in thread\n")
        }
    }
    sleep(1000000)
    print("in main, count = ${count}\n")
    return 0
}
