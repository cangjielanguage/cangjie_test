// EXEC: %compiler %cmp_opt %sync-link %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in main, count = 10\n
// ASSERT: scan-not Exception

from std import sync.*

var count: Int64 = 0

class Test {
    static var mtx: Mutex = Mutex()

    static func testfunc(): Unit {
        synchronized(mtx) {
            count = count + 1
        }
    }
}

func main(): Int64 {
    var i: Int64 = 0
    while (i < 10) {
        i = i + 1
        spawn {
            Test.testfunc()
        }
    }
    while (count < 10) {
        sleep(0)
    }
    print("in main, count = ${count}\n")
    return 0
}
