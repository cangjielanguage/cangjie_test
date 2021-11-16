// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan error\nresult = 0\n
// ASSERT: scan-not Exception

@overflowWrapping
func main(): Int64 {
    var result: UInt16 = 65535

    let fut: Future<UInt16> = spawn {
        var a: UInt16 = 65535
        sleep(100*100*10)
        return a + 1
    }

    let opt: Result<UInt16> = fut.getResult(1)

    match (opt) {
        case Ok(res) => result = res
        case Err(_) => print("error\n")
    }

    let opt1: Result<UInt16> = fut.getResult(9223372036854775807)

    match (opt1) {
        case Ok(res) => result = res
        case Err(_) => print("error\n")
    }

    if (result != 0 || !fut.isDone()) {
        return 1
    }
    print("result = ${result}\n")
    return 0
}
