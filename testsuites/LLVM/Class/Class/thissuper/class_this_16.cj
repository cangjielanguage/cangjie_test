// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Test {
    var i: Int32 = 2
    func foo(x: Int32): String{
        var i: Int32 = this.bar() + x
        return i.toString()
    }
    func bar(): Int32 {
        return 3
    }
}

class Data<T>{
    var i: Int32 = 2
    func foo(x: Int32): Int32{
        var i: Int32 = this.bar() + x
        return i
    }
    func bar(): Int32 {
        return 3
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: String = test.foo(3)
    var res2: Int32 = data.foo(4)
    if (res1 == "6" && res2 == 7) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
