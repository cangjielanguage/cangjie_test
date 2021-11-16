// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result = 2\n
// ASSERT: scan-not Exception

class Test {
    let n: Int64

    init(n: Int64) {
        this.n = n
    }
}

func main(): Int64 {
    var result: Test = Test(1)

    let fut: Future<Test> = spawn {
        var result: Test = Test(2)
        return result
    }

    let opt: Result<Test> = fut.getResult()

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
