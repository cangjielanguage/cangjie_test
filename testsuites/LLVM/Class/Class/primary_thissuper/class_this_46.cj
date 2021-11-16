// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


class Test {
    var a: Int32 = 2
    var b: Int32 = 4
    func foo(x: Int32): Int32{
        var c = this.a + this.b + x
        return c
    }
}

class Data<T> {
    var a: T
    var b: T
    Data(x: T, y: T){
        a = x
        b = y
    }
    func foo(): T{
        var c: T = this.b
        return c
    }

}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>(3,5)
    var res1: Int32 = test.foo(2)
    var res2: Int32 = data.foo()
    if(res1 == 8 && res2 == 5){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
