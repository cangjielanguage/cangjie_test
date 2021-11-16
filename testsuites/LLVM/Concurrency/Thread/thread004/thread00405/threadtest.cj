// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Exception occured: java.lang.Error: stack overflow, more than 100 split stack required

func test(i: Int64): Int64{
    if (i == 0) {
        return 0
    }
    return i + test(i - 1)
}

func main(): Int64 {
    let fut: Future<Int64> = spawn {
        var c: Int32 = 0
        while (c < 1000) {
            test(100000000)
            c = c + 1
        }
        test(100000000)
    }

    let res: Result<Int64> = fut.getResult()
    var result: Int64 = 0
    match (res) {
        case Ok(val) => result = val
        case Err(e) => print("Exception occured: ${e}\n")
    }
    print("result = ${result}\n")
    return 0
}
