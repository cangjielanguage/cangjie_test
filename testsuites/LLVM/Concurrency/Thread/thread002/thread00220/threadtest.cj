// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result = 2\n
// ASSERT: scan-not Exception

func main(): Int64 {
    var result: Int32 = 1

    let fut: Future<Int32> = spawn {
        let a: Int32 = 2
        return a
    }

    var opt: Result<Int32> = fut.getResult()

    match (opt) {
        case Ok(res) => result = res
        case Err(_) => print("error\n")
    }

    if (result != 2 || !fut.isDone()) {
        return 1
    }
    print("result = ${result}\n")
    return 0
}
