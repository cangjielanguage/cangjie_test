// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test {
    var i: Int32 = 2
    var x = this.i
}

class Data<T> {
    var i: Int32 = 2
    var x = this.i
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    return 0
}

func main(): Int64 {
    return run()
}
