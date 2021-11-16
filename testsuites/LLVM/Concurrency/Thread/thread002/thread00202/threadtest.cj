// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result1 = 1\nresult2 = 1\nresult3 = 1\nresult4 = 1\nresult5 = 1\nresult6 = 1\nresult7 = 1\nresult8 = 1\nresult9 = 1.000002\nresult10 = 1.000000002\n
// ASSERT: scan-not Exception

func main(): Int64 {
    var result1: Int8 = 0
    var result2: Int16 = 0
    var result3: Int32 = 0
    var result4: Int64 = 0
    var result5: UInt8 = 0
    var result6: UInt16 = 0
    var result7: UInt32 = 0
    var result8: UInt64 = 0
    var result9: Float32 = 0.0
    var result10: Float64 = 0.0

    let fut1: Future<Int8> = spawn {
        var a: Int8 = 0
        a = a + 1
        return a
    }

    let fut2: Future<Int16> = spawn {
        var a: Int16 = 0
        a = a + 1
        return a
    }

    let fut3: Future<Int32> = spawn {
        var a: Int32 = 0
        a = a + 1
        return a
    }

    let fut4: Future<Int64> = spawn {
        var a: Int64 = 0
        a = a + 1
        return a
    }

    let fut5: Future<UInt8> = spawn {
        var a: UInt8 = 0
        a = a + 1
        return a
    }

    let fut6: Future<UInt16> = spawn {
        var a: UInt16 = 0
        a = a + 1
        return a
    }

    let fut7: Future<UInt32> = spawn {
        var a: UInt32 = 0
        a = a + 1
        return a
    }

    let fut8: Future<UInt64> = spawn {
        var a: UInt64 = 0
        a = a + 1
        return a
    }

    let fut9: Future<Float32> = spawn {
        var a: Float32 = 0.0
        a = a + 1.000002
        return a
    }

    let fut10: Future<Float64> = spawn {
        var a: Float64 = 0.0
        a = a + 1.000000002
        return a
    }

    let opt1: Result<Int8> = fut1.getResult()
    let opt2: Result<Int16> = fut2.getResult()
    let opt3: Result<Int32> = fut3.getResult()
    let opt4: Result<Int64> = fut4.getResult()
    let opt5: Result<UInt8> = fut5.getResult()
    let opt6: Result<UInt16> = fut6.getResult()
    let opt7: Result<UInt32> = fut7.getResult()
    let opt8: Result<UInt64> = fut8.getResult()
    let opt9: Result<Float32> = fut9.getResult()
    let opt10: Result<Float64> = fut10.getResult()

    match (opt1) {
        case Ok(res) => result1 = res
        case Err(_) => print("error\n")
    }

    match (opt2) {
        case Ok(res) => result2 = res
        case Err(_) => print("error\n")
    }

    match (opt3) {
        case Ok(res) => result3 = res
        case Err(_) => print("error\n")
    }

    match (opt4) {
        case Ok(res) => result4 = res
        case Err(_) => print("error\n")
    }

    match (opt5) {
        case Ok(res) => result5 = res
        case Err(_) => print("error\n")
    }

    match (opt6) {
        case Ok(res) => result6 = res
        case Err(_) => print("error\n")
    }

    match (opt7) {
        case Ok(res) => result7 = res
        case Err(_) => print("error\n")
    }

    match (opt8) {
        case Ok(res) => result8 = res
        case Err(_) => print("error\n")
    }

    match (opt9) {
        case Ok(res) => result9 = res
        case Err(_) => print("error\n")
    }

    match (opt10) {
        case Ok(res) => result10 = res
        case Err(_) => print("error\n")
    }

    if (result1 != 1 || result2 != 1 || result3 != 1 || result4 != 1 || result5 != 1 || result6 != 1 || result7 != 1 || result8 != 1 || result9 <= 1.000001 || result9 >= 1.000003 || result10 <= 1.0000000019 || result10 >= 1.0000000021) {
        return 1
    }

    if (!fut1.isDone() || !fut2.isDone() || !fut3.isDone() || !fut4.isDone() || !fut5.isDone() || !fut6.isDone() || !fut7.isDone() || !fut8.isDone() || !fut9.isDone() || !fut10.isDone()) {
        return 2
    }

    print("result1 = ${result1}\n")
    print("result2 = ${result2}\n")
    print("result3 = ${result3}\n")
    print("result4 = ${result4}\n")
    print("result5 = ${result5}\n")
    print("result6 = ${result6}\n")
    print("result7 = ${result7}\n")
    print("result8 = ${result8}\n")
    print("result9 = 1.000002\n")
    print("result10 = 1.000000002\n")
    return 0
}
