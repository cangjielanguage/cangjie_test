// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan fut1 oops\nfut2 oops
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

from std import sync.*
var sum: Int64 = 0
let mutex = Mutex()

func main(): Int64 {
    for (i in 0..100) {
        spawn { =>
        mutex.lock()
        sum = sum + 1
        
        // Error: 没有解锁，其他等待获取当前互斥锁的线程会一直阻塞，无法继续运行
        }

    }
    
    let fut1 = spawn { =>
        sum = sum + 1
        mutex.unlock() // Error: 没有获取锁就执行解锁，抛出异常
        return 0
    }

    let res1: Result<Int64> = fut1.getResult(1000*1000)
    // TODO: Result<T> 修改实现后，下方 match-case 示例需修改。
    match (res1) {
    case Ok(val) => print("result = ${val}\n")
    case Err(_) => print("fut1 oops\n")
    }

    sleep(1000)
  
    let fut2 = spawn { =>
        mutex.tryLock() // Error: `tryLock()` 仅仅是尝试获取锁，不保证能获取到
        sum = sum + 1
        mutex.unlock()
        return 0
    }

    let res2: Result<Int64> = fut2.getResult(1000*1000)
    // TODO: Result<T> 修改实现后，下方 match-case 示例需修改。
    match (res2) {
    case Ok(val) => print("result = ${val}\n")
    case Err(_) => print("fut2 oops\n")
    }
    
    return 0
}

