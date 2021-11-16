// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result = Unit\n
// ASSERT: scan-not Exception

func main(): Int64 {
    var result: Unit = ()

    let fut: Future<Unit> = spawn {
        var a: Unit = ()
        return a
    }

    let opt: Result<Unit> = fut.getResult()

    match (opt) {
        case Ok(res) => result = res
        case Err(_) => print("error\n")
    }

    if (result != () || !fut.isDone()) {
        return 1
    }
    print("result = Unit\n")
    return 0
}
