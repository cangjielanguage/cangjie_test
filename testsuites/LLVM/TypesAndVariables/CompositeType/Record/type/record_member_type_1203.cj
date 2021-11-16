// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Foo<T>{
    var dt: T
    init(x: T){
        dt = x
    }
}

func f1<T>(x: T): T{
    return x
}

record Test {
    var f2: (Foo<Int32>) -> Foo<Int32> = f1<Foo<Int32>>
}

func run(): Int64 {
    var i: Int32 = 2
    var foo: Foo<Int32> = Foo<Int32>(i)
    var foo2: Foo<Int32> = Test().f2(foo)
    let res: Int32 = foo2.dt
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
