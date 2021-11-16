// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Test {
    var a: Int32 = 1
    var b: Int32
    init(b: Int32){
        this.b = this.a + b
    }
}

class Data<T> {
    var a: T
    var b: T
    init(a: T){
        this.a = a
        b = this.a
    }
}

func run(): Int64 {
    var test: Test = Test(1)
    var data: Data<Int32> = Data<Int32>(4)
    var res1: Int32 = test.b
    var res2: Int32 = data.b
    if (res1 == 2 && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
