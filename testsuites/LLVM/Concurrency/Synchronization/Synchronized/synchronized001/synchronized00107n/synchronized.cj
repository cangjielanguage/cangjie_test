// EXEC: %compiler %cmp_opt %sync-link %f -o %output 2>&1 | compare %f

from std import sync.*

var count: Int64 = 0
var mtx: Mutex = Mutex()

func test(): Unit {
    synchronized() { // EXPECTED: regex invalid expression initialization
        count = count + 1
    }
}

func main(): Int64 {
    var i: Int64 = 0
    while (i < 10) {
        i = i + 1
        spawn {
            test()
        }
    }
    while (count < 10) {
        sleep(0)
    }
    print("in main, count = ${count}\n")
    return 0
}
