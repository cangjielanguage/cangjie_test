// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan count = 1000
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

from std import sync.*
var count: Int64 = 0
let mtx = Mutex()

func main(): Int64 {
    let list = ArrayList<Future<Unit>>()

    // creat 1000 threads.
    for (i in 0..1000) {
        let fut = spawn {
            sleep(1 * 1000 * 1000) // sleep for 1ms.
            mtx.lock()
            count++
            mtx.unlock()
        }
        list.add(fut)

    }

    // Wait for all threads finished.
    for (f in list) {
        f.getResult()
    }

    print("count = ${count}\n")
    return 0
}