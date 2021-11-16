// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Foo {
    let a: Int32
    init(x: Int32){
        a = x + 2
    }
}

class Test {
    let c1: Foo = Foo(2)
    let c2: Foo
    init(x: Foo){
        c2 = x
    }
    func f(x: Foo): Foo{
        return x
    }
}

func run(): Int64 {
    var foo1: Foo = Foo(3)
    var foo2: Foo = Foo(4)
    var test: Test = Test(foo1)
    var res1: Foo = test.c1
    var res2: Foo = test.c2
    var res3: Foo = test.f(foo2)
    if (res1.a == 4 && res2.a == 5 && res3.a == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}