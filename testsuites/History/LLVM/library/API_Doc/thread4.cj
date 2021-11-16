from sync import sync.*

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

    /* 睡眠10毫秒，以确保新线程可以执行*/
    sleep(10 * 1000 * 1000)

    mtx.lock()
    print("Main thread: set flag\n")
    flag = false
    mtx.unlock()

    print("Main thread: notify\n")
    cv.notifyAll()

    /* 等待新线程完成 */
    fut.getResult()
    return 0
}

