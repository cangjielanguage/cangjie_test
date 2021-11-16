// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Test {
    var i: Int32
    init(x: Int32){
        i = x
        this
    }
}

class Data<T> {
    var i: T
    init(x: T){
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
