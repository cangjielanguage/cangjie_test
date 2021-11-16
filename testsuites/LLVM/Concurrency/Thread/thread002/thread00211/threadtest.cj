// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result = Time.Month\n
// ASSERT: scan-not Exception

enum Time {
    Year | Month | Day | Hour
}

func main(): Int64 {
    var result: Time = Time.Year

    let fut: Future<Time> = spawn {
        var result: Time = Time.Month
        return result
    }

    let opt: Result<Time> = fut.getResult()

    match (opt) {
        case Ok(res) => result = res
        case Err(_) => print("error\n")
    }

    if (!fut.isDone()) {
        return 1
    }

    match (result) {
        case Month => print("result = Time.Month\n")
    }

    return 0
}
