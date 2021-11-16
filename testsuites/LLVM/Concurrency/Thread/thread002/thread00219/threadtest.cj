// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result = 2\n
// ASSERT: scan-not Exception

func main(): Int64 {
    var result: Int64 = 1

    var fut: Future<Int64> = spawn {
        var a: Int64 = 2
        return a
    }

    let opt: Result<Int64> = fut.getResult()

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
