// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test {
    var i: Int32 = 2
    var this.i = 3    // EXPECTED: regex 'this' is keyword not identifier
}

class Data<T> {
    var i: Int32 = 2
    var this.i = 3    // EXPECTED: regex 'this' is keyword not identifier
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    return 0
}

func main(): Int64 {
    return run()
}
