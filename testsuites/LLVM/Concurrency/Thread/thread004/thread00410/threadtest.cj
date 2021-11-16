// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan result1 = 18003000\nresult2 = 18003000\nresult3 = 18003000\nresult4 = 18003000\nresult5 = 18003000\n
// ASSERT: scan-not Exception

class A {
    func test(i: Int64): Unit {
        var a: Int64 = 1000
        while(a >= i) {
            a = a - 1
        }
    }
}

func test(i: Int64): Int64{
    var a: A = A()
    a.test(i)
    if (i == 0) {
        return 0
    }
    return i + test(i - 1)
}

func main(): Int64 {
    var fut: Future<Int64> = spawn {
        test(6000)
    }

    var res: Result<Int64> = fut.getResult()
    var result: Int64 = 0
    match (res) {
        case Ok(val) => result = val
        case Err(e) => print("Exception1 occured: ${e}\n")
    }

    print("result1 = ${result}\n")

    fut = spawn {
        test(6000)
    }

    res = fut.getResult()
    result = 0
    match (res) {
        case Ok(val) => result = val
        case Err(e) => print("Exception2 occured: ${e}\n")
    }

    print("result2 = ${result}\n")

    fut = spawn {
        test(6000)
    }

    res = fut.getResult()
    result = 0
    match (res) {
        case Ok(val) => result = val
        case Err(e) => print("Exception3 occured: ${e}\n")
    }

    print("result3 = ${result}\n")

    fut = spawn {
        test(6000)
    }

    res = fut.getResult()
    result = 0
    match (res) {
        case Ok(val) => result = val
        case Err(e) => print("Exception4 occured: ${e}\n")
    }

    print("result4 = ${result}\n")

    fut = spawn {
        test(6000)
    }

    res = fut.getResult()
    result = 0
    match (res) {
        case Ok(val) => result = val
        case Err(e) => print("Exception5 occured: ${e}\n")
    }

    print("result5 = ${result}\n")
    return 0
}
