// EXEC: %compiler %cmp_opt %sync-link %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main, count = 10\n
// ASSERT: scan-not Exception

from std import sync.*

var count: Int64 = 0

class Test {
    static var mtx: Mutex = Mutex()
}

func main(): Int64 {
    var i: Int64 = 0
    while (i < 10) {
        i = i + 1
        spawn {
            synchronized(Test.mtx) {
                count = count + 1
            }
        }
    }
    while (count < 10) {
        sleep(0)
    }
    synchronized(Test.mtx) {
        print("in main, count = ${count}\n")
    }
    return 0
}
