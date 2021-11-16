// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result = 1, 2\n
// ASSERT: scan-not Exception

func main(): Int64 {
    var result: (Int32*Int32) = (0, 1)

    let fut: Future<(Int32*Int32)> = spawn {
        return (1, 2)
    }

    let opt: Result<(Int32*Int32)> = fut.getResult()

    match (opt) {
        case Ok(res) => result = res
        case Err(_) => print("error\n")
    }

    if (result[0] != 1 || result[1] != 2 || !fut.isDone()) {
        return 1
    }
    print("result = ${result[0]}, ${result[1]}\n")
    return 0
}
