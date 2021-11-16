// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


class Test {
    var a: Int32 = 2
    var b: Int32 = 0
    init() {}
    init(x: Int32){
        this()
        b = Test.foo(this.a)
    }
    static func foo(x: Int32): Int32{
        var i = x + 1
        return i
    }
}

class Data<T> {
    var a: T
    var b: T
    init(x: T){
        this.a = x
        this.b = x
    }
    init(x: T, y: T){
        this(x)
        b = Data<T>.foo(this.a, y)
    }
    static func foo(x: T, y: T): T{
        return y
    }

}

func run(): Int64 {
    var test: Test = Test(2)
    var data: Data<Int32> = Data<Int32>(3,5)
    var res1: Int32 = test.a
    var res2: Int32 = test.b
    var res3: Int32 = data.a
    var res4: Int32 = data.b
    if(res1 ==2 && res2 == 3 && res3 == 3 && res4 ==5){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
