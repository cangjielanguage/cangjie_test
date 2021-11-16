// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result = 1\n
// ASSERT: scan-not Exception

func main(): Int64 {
    var result: Int32 = 0

    let fut: Future<Int32> = spawn {
        var a: Int32 = 0
        a = a + 1
        return a
    }

    let opt: Result<Int32> = fut.getResult()

    match (opt) {
        case Ok(res) => result = res
        case Err(_) => print("error\n")
    }

    if (result != 1 || !fut.isDone()) {
        return 1
    }
    print("result = ${result}\n")
    return 0
}
