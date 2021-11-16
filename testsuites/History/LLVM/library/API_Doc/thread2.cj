func main(): Int64 {
    let fut: Future<Unit> = spawn { =>
        for (i in 0..10) {
            print("New thread, number = ${i}\n")
            sleep(100*1000*1000) /* 睡眠 100毫秒 */
        }
    }

    fut.getResult() /* 等待线程完成 */

    for (i in 0..5) {
        print("Main thread, number = ${i}\n")
        sleep(100*1000*1000) /* 睡眠 100毫秒 */
    }
    return 0
}

