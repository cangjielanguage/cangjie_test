// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Test {
    var i: Int32 = 2
    func foo(x: Int32): String{
        i = this.i + x
        return i.toString()
    }
}

class Data<T>{
    var i: T
    Data(x: T){
         i = x
    }
    func foo(x: T): Unit{
        this.i = x
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>(1)
    data.foo(4)
    var res1: String = test.foo(3)
    var res2: Int32 = data.i
    if (res1 == "5" && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
