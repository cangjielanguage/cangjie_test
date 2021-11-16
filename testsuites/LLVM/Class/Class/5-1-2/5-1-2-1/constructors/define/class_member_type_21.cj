// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Foo<T> {
    let a: T
    init(x: T) {
        a = x
    }
}

class Test {
    let c1: Foo<Int32> = Foo<Int32>(2)
    let c2: Foo<Int32>
    init(x: Foo<Int32>){
        c2 = x
    }
    func f(x: Foo<Int32>): Foo<Int32>{
        return x
    }
}

func run(): Int64 {
    var foo1: Foo<Int32> = Foo<Int32>(3)
    var foo2: Foo<Int32> = Foo<Int32>(4)
    var test: Test = Test(foo1)
    var res1: Foo<Int32> = test.c1
    var res2: Foo<Int32> = test.c2
    var res3: Foo<Int32> = test.f(foo2)
    if (res1.a == 2 && res2.a == 3 && res3.a == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}