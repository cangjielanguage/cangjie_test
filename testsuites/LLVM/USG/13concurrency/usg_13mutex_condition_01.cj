// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan New thread: before wait\nMain thread: set flag\nMain thread: notify\nNew thread: after wait
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

from std import sync.*

var mtx = Mutex()
var cv = mtx.newCondition()
var flag : Bool = true

func main() : Int64 {
    let fut = spawn {
        mtx.lock()
        while (flag) {
            print("New thread: before wait\n")
            cv.wait()
            print("New thread: after wait\n")
        }
        mtx.unlock()
    }

    // sleep for 10ms, to make sure the new thread can be executed.
    sleep(10 * 1000 * 1000)

    mtx.lock()
    print("Main thread: set flag\n")
    flag = false
    mtx.unlock()

    print("Main thread: notify\n")
    cv.notifyAll()

    // wait for the new thread finished.
    fut.getResult()
    return 0
}