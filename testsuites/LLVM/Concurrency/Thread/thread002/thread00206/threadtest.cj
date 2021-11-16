// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result = 仓颉\n
// ASSERT: scan-not Exception

func main(): Int64 {
    var result: String = "cangjie"

    let fut: Future<String> = spawn {
        var a: String = "仓颉"
        return a
    }

    let opt: Result<String> = fut.getResult()

    match (opt) {
        case Ok(res) => result = res
        case Err(_) => print("error\n")
    }

    if (result != "仓颉" || !fut.isDone()) {
        return 1
    }
    print("result = ${result}\n")
    return 0
}
