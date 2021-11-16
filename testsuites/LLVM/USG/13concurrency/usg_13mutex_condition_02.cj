// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fut1 oops
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

from std import sync.*
var m1 = Mutex()
var m2 = Mutex()
var c = m1.newCondition()
var flag : Bool = true
var count : Int64 = 0


func main() : Int64 {
    let fut1 = spawn {
        m2.lock() // Error：和条件变量一起使用的锁，必须是同一把锁，否则 `wait` 中的解锁操作会抛出异常
        while (flag) {
            c.wait()
        }
        count = count + 1
        m2.unlock()
        return 0
    }

    //检查点
    let res1: Result<Int64> = fut1.getResult(1000*1000)
    // TODO: Result<T> 修改实现后，下方 match-case 示例需修改。
    match (res1) {
    case Ok(val) => print("result = ${val}\n")
    case Err(_) => print("fut1 oops\n")
    }

    m1.lock()
    flag = false
    m1.unlock()
    c.notifyAll()
    return 0
    
}

