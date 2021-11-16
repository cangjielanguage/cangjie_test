// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan in main, count = 10
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

from std import sync.*

var count: Int64 = 0
var mtx: Mutex = Mutex()

func main(): Int64 {
    let list = ArrayList<Future<Unit>>()
    for (i in 0..10) {
        let fut = spawn {
            while (true) {
                synchronized(mtx) {
                    count = count + 1
                    break
                    print("in thread\n")
                }
            }
        }
        list.add(fut)
    }

    // Wait for all threads finished.
    for (f in list) {
        f.getResult()
    }

    synchronized(mtx) {
        print("in main, count = ${count}\n")
    }
    return 0
    
}

