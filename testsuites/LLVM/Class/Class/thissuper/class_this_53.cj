// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


class Test {
    var a: Int32 = 2
    var b: Int32 = 4
    func foo(): Test{
        return this
    }
}

class Data<T> {
    var a: T
    var b: T
    init(x: T, y: T){
        a = x
        b = y
    }
    func foo(): Data<T>{
        return this
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>(3,5)
    var res1: Test = test.foo()
    var res2: Data<Int32> = data.foo()
    if(res1.a == 2 && res2.b == 5){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
