// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


class Test {
    var a: Int32 = 2
    var b: Int32 = 4
    func foo(): Int32{
        var c = Test.bar(this.b)
        return c
    }
    static func bar(t: Int32): Int32{
        var i = t + 1
        return i
    }
}

class Data<T> {
    var a: T
    var b: T
    init(x: T, y: T){
        a = x
        b = y
    }
    func foo(): T{
        var c: T = Data<T>.bar(this.a)
        return c
    }
    static func bar(d: T): T{
        return d
    }

}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>(3,5)
    var res1: Int32 = test.foo()
    var res2: Int32 = data.foo()
    if(res1 == 5 && res2 == 3){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
