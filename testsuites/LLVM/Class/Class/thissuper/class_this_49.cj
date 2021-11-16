// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


class Test {
    var a: Int32 = 2
    var b: Int32 = 4
    func foo(): Int32{
        var c = this.bar(this)
        return c
    }
    func bar(t:Test): Int32{
        var i = t.a + 1
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
        var c: T = this.bar(this)
        return c
    }
    func bar(d: Data<T>): T{
        return d.b
    }

}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>(3,5)
    var res1: Int32 = test.foo()
    var res2: Int32 = data.foo()
    if(res1 == 3 && res2 == 5){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
