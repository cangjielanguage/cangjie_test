// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


class Test {
    var i1 = super.i    // EXPECTED: regex 'super' is not allowed to initialize non-static member
}

class Data<T> {
    var i1 = super.i + 1    // EXPECTED: regex 'super' is not allowed to initialize non-static member
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    return 0
}

func main(): Int64 {
    return run()
}
