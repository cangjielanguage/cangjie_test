// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in interface\n
// ASSERT: scan-not Exception

interface Test {
    func test() {
        print("in interface\n")
    }
}

class Child <: Test {
    let n: Int64

    init(n: Int64) {
        this.n = n
    }
}

func main(): Int64 {
    var result: Test = Child(1)

    let fut: Future<Test> = spawn {
        var result: Test = Child(2)
        return result
    }

    let opt: Result<Test> = fut.getResult()

    match (opt) {
        case Ok(res) => result = res
        case Err(_) => print("error\n")
    }

    if (!fut.isDone()) {
        return 1
    }
    result.test()
    return 0
}
