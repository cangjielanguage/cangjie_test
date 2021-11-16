// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan result = 1
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
    let fut: Future<Int64> = spawn {
        sleep(1000*1000*1000) // sleep for 1s.
        return 1
    }
    // wait for the thread to finish, and get the result.
    let res: Result<Int64> = fut.getResult()
    // TODO: Result<T> 修改实现后，下方 match-case 示例需修改。
    match (res) {
        case Ok(val) => print("result = ${val}\n")
        case Err(_) => print("oops\n")
    }
    return 0
}
