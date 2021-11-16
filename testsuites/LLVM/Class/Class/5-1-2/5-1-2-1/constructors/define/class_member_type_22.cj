// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I {
    func y(): Int32
}

class Foo1 <: I{
    func y(): Int32 { 4 }
}

class Foo2 <: I{
    func y(): Int32 { 5 }
}

class Foo3 <: I{
    func y(): Int32 { 6 }
}

class Test {
    var a: I = Foo1()
    var b: I
    init(x: I){
        b = x
    }
    func f(x: I): I{
        return x
    }
}

func run(): Int64 {
    var test: Test = Test(Foo2())
    var res1: I = test.a // Foo1()
    var res2: I = test.b // Foo2()
    var res3: I = test.f(Foo3()) // Foo3()
    if (res1.y() == 4 && res2.y() == 5 && res3.y() == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
