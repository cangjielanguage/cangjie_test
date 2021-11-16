// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result = 2\n
// ASSERT: scan-not Exception

record Test<T> {
    var n: T

    init(n: T) {
        this.n = n
    }
}

func main(): Int64 {
    var result: Test<Int64> = Test(1)

    let fut: Future<Test<Int64>> = spawn {
        var result: Test<Int64> = Test(2)
        return result
    }

    let opt: Result<Test<Int64>> = fut.getResult()

    match (opt) {
        case Ok(res) => result = res
        case Err(_) => print("error\n")
    }

    if (result.n != 2 || !fut.isDone()) {
        return 1
    }
    print("result = ${result.n}\n")
    return 0
}
