// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I<T> {
    func f(x: T): T
}

class Foo1 <: I<Int32> {
    func f(x: Int32): Int32{
        return x + 1
    }
}

class Foo2 <: I<Int32> {
    func f(x: Int32): Int32{
        return x + 2
    }
}

class Foo3 <: I<Int32> {
    func f(x: Int32): Int32{
        return x + 3
    }
}

class Test {
    var a: I<Int32> = Foo1()
    var b: I<Int32>
    init(x: I<Int32>){
        b = x
    }
    func f(x: I<Int32>): I<Int32> {
        return x
    }
}

func run(): Int64 {
    var test: Test = Test(Foo2())
    var res1: I<Int32> = test.a
    var res2: I<Int32> = test.b
    var res3: I<Int32> = test.f(Foo3())
    if (res1.f(1) == 2 && res2.f(1) == 3 && res3.f(1) == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
