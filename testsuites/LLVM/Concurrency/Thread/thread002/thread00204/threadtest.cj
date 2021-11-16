// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result = true\n
// ASSERT: scan-not Exception

func main(): Int64 {
    var result: Bool = false

    let fut: Future<Bool> = spawn {
        var a: Bool = true
        return a
    }

    let opt: Result<Bool> = fut.getResult()

    match (opt) {
        case Ok(res) => result = res
        case Err(_) => print("error\n")
    }

    if (!result || !fut.isDone()) {
        return 1
    }
    print("result = ${result}\n")
    return 0
}
