// EXEC: %compiler -frontend -typecheck %cmp_opt %n.cj


class Test {
    var a: Int32 = 2
    var b: Int32 = 0
    init() {}
    init(x: Int32){
        this()
        a = a + x
        b = foo(this)
    }
    func foo(t:Test): Int32{
        var i = t.a + 1
        return i
    }
}

class Data<T> {
    var a: T
    var b: Data<T>
    init(x: T, y: Int32) {
        a = x
        b = Data<T>(x)
    }
    init(x: T){
        this(x, 0)
        b = foo(this)
    }
    func foo(d: Data<T>): Data<T>{
        return d
    }

}

func run(): Int64 {
    var test: Test = Test(2)
    var data: Data<Int32> = Data<Int32>(3)
    var res1: Int32 = test.b
    var res2: Int32 = data.b.a
    if(res1 == 5 && res2 == 3){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
