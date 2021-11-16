from sync import sync.*

let count = AtomicInt64(0)

func main(): Int64 {
    let list = ArrayList<Future<Int64>>()

    /*创建1000个线程*/
    for (i in 0..1000) {
        let fut = spawn {
            sleep(1 * 1000 * 1000) /* 睡眠 1毫秒 */
            count.fetchAdd(1)
        }
        list.add(fut)
    }

    /* 等待所有线程完成 */
    for (f in list) {
        f.getResult()
    }

    var val = count.load()
    print("count = ${val}\n")
    return 0
}

