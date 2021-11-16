// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan count = 1000
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

from std import sync.*
let count = AtomicInt64(0)

func main(): Int64 {
    let list = ArrayList<Future<Int64>>()

    // creat 1000 threads.
    for (i in 0..1000) {
        let fut = spawn {
            sleep(1 * 1000 * 1000) // sleep for 1ms.
            count.fetchAdd(1)
        }
        list.add(fut)
    }

    // Wait for all threads finished.
    for (f in list) {
        f.getResult()
    }

    var val = count.load()
    print("count = ${val}\n")
    return 0
    
}
