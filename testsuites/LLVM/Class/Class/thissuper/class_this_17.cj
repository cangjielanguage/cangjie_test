// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base{
    func foo(x: Int32): String{
        return x.toString()
    }
}

class Test <: Base {
    var a: String = "hello"
    func f(x: Int32){
        a = this.foo(x)
    }
}

class Data<T> <: Base {
    var a: String = "CharLang"
    func f(x: Int32){
        a = this.foo(x)
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    test.f(3)
    data.f(4)
    var res1: String = test.a
    var res2: String = data.a
    if (res1 == "3" && res2 == "4") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
