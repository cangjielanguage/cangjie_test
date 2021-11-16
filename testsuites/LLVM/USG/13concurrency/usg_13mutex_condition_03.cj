// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan main 0\n
// ASSERT: scan fut1 oops\n
// ASSERT: scan-not spawn 1\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

from std import sync.*
var m1 = Mutex()
var m2 = Mutex()
var c = m1.newCondition()
var flag : Bool = true
var count : Int64 = 0
var inSpawn : Bool = false


func main() : Int64 {
    let fut1 = spawn {
        while (flag) {
        inSpawn = true
        c.wait() // Error：条件变量的 `wait` 必须在持有锁的情况下被调用
        }
        count = count + 1
        print("spawn ${count}\n")
    }
    
    print("main ${count}\n")
    while (!inSpawn){}
    m1.lock()
    flag = false
    m1.unlock()
    c.notifyAll()

    let res1 = fut1.getResult()
    match (res1) {
    case Ok(val) => print("result = ${count}\n")
    case Err(_) => print("fut1 oops\n")
    }

    return 0
    
}

