// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result = () -> Int64\nfinish\n
// ASSERT: scan-not Exception

func main(): Int64 {
    let fut: Future<() -> Int64> = spawn {
        { return 1 }
    }

    let opt: Result<() -> Int64> = fut.getResult()

    match (opt) {
        case Ok(res) => print("result = () -> Int64\n")
        case Err(_) => print("error\n")
    }

    if (!fut.isDone()) {
        return 1
    }
    print("finish\n")
    return 0
}
