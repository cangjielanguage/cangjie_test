// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

class Foo<T> {
    var x: T
    var y: T
    init(a: T, b: T){
        x = a
        y = b
    }
}

record Data<T>{
    var foo: T
    init(foo1: T){
        foo = foo1
    }
}

func run(): Int64 {
    let foo: Foo<Int32> = Foo<Int32>(1, 2)
    var foo2: Data<Foo<Int32>> = Data<Foo<Int32>>(foo)
    var getFoo: Foo<Int32> = foo2.foo
    var res1: Int32 = getFoo.x
    var res2: Int32 = getFoo.y
    if (res1 == 1 && res2 == 2){
        return 0
    }
    return 1
}
