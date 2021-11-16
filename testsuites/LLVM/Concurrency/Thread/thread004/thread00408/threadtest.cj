// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Exception1 occured: default.A\n
// ASSERT: scan Exception2 occured: default.A\n
// ASSERT: scan Exception3 occured: default.A\n
// ASSERT: scan Exception4 occured: default.A\n
// ASSERT: scan Exception5 occured: default.A\n
// ASSERT: scan result1 = 0\n
// ASSERT: scan result2 = 0\n
// ASSERT: scan result3 = 0\n
// ASSERT: scan result4 = 0\n
// ASSERT: scan result5 = 0\n

class A <: Exception {}

func test(i: Int64): Int64{
    if (i == 0) {
        throw A()
    }
    return i + test(i - 1)
}

func main(): Int64 {
    let fut1: Future<Int64> = spawn {
        test(10000)
    }

    let fut2: Future<Int64> = spawn {
        test(20000)
    }

    let fut3: Future<Int64> = spawn {
        test(30000)
    }

    let fut4: Future<Int64> = spawn {
        test(40000)
    }

    let fut5: Future<Int64> = spawn {
        test(50000)
    }

    let res1: Result<Int64> = fut1.getResult()
    let res2: Result<Int64> = fut2.getResult()
    let res3: Result<Int64> = fut3.getResult()
    let res4: Result<Int64> = fut4.getResult()
    let res5: Result<Int64> = fut5.getResult()
    var result1: Int64 = 0
    var result2: Int64 = 0
    var result3: Int64 = 0
    var result4: Int64 = 0
    var result5: Int64 = 0
    match (res1) {
        case Ok(val) => result1 = val
        case Err(e) => print("Exception1 occured: ${e}\n")
    }

    match (res2) {
        case Ok(val) => result2 = val
        case Err(e) => print("Exception2 occured: ${e}\n")
    }

    match (res3) {
        case Ok(val) => result3 = val
        case Err(e) => print("Exception3 occured: ${e}\n")
    }

    match (res4) {
        case Ok(val) => result4 = val
        case Err(e) => print("Exception4 occured: ${e}\n")
    }

    match (res5) {
        case Ok(val) => result5 = val
        case Err(e) => print("Exception5 occured: ${e}\n")
    }

    print("result1 = ${result1}\n")
    print("result2 = ${result2}\n")
    print("result3 = ${result3}\n")
    print("result4 = ${result4}\n")
    print("result5 = ${result5}\n")
    return 0
}
