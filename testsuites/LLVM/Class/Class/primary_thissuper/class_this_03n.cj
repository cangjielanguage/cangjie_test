// EXEC: %compiler %cmp_opt %f -o %n.%suffix 2>&1 | compare %f
// EXEC: %run %run_opt %n.%suffix %run_args
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test {
    var i: Int32
    Test(x: Int32){
        i = x
        this
    }
}

class Data<T> {
    var i: T
    Data(x: T){
        i = x
        this
    }
}

func run(): Int64 {
    var test: Test = Test(3)
    var data: Data<Int32> = Data<Int32>(4)
    return 0
}

func main(): Int64 {
    return run()
}
