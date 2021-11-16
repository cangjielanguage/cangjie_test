// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


class Test {
    var a: Int32 = 2
    var b: Int32 = 0
    func foo(x: Int32): Int32{
        this.b = 4
        return this.a + this.b + x
    }
}

class Data<T> {
    var a: T
    var b: T
    init(x: T){
        a = x
        b = x
    }
    func foo(y: T): T{
        this.b = y
        return this.b
    }

}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>(3)
    var res1: Int32 = test.foo(2)
    var res2: Int32 = data.foo(5)
    if(res1 == 8 && res2 == 5){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
