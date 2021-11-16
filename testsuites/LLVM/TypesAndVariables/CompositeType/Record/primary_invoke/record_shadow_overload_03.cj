// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

record Data<T> {
    var a: T
    Data(x: T) {
        a = x
    }
    func area<T>(res: T){ // EXPECTED: regex non-static generic member function 'area' is not supported
        return res
    }
}

func run(): Int64 {
    var i1: Int32 = 2
    var i2: Int64 = 4
    var test: Test<Int32> = Test<Int32>(i1)
    var area: Int64 = test.area<Int64>(i2)
    var res: Int32 = test.a
    if (res == 2 && area == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
