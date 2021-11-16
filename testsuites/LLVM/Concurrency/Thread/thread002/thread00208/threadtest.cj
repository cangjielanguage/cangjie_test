// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result = 0..2:1\n
// ASSERT: scan-not Exception

func main(): Int64 {
    var result: Range<Int64> = 0..1:1
    var range: Range<Int64> = 0..2:1

    let fut: Future<Range<Int64>> = spawn {
        var a: Range<Int64> = 0..2:1
        return a
    }

    let opt: Result<Range<Int64>> = fut.getResult()

    match (opt) {
        case Ok(res) => result = res
        case Err(_) => print("error\n")
    }

    if (result != range || !fut.isDone()) {
        return 1
    }

    print("result = 0..2:1\n")
    return 0
}
