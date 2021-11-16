// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result = 颉\n
// ASSERT: scan-not Exception

func main(): Int64 {
    var result: Char = '仓'

    let fut: Future<Char> = spawn {
        var a: Char = '颉'
        return a
    }

    let opt: Result<Char> = fut.getResult()

    match (opt) {
        case Ok(res) => result = res
        case Err(_) => print("error\n")
    }

    if (result != '颉' || !fut.isDone()) {
        return 1
    }
    print("result = ${result}\n")
    return 0
}
