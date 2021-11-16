// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

class Foo<T>{
    var a: Int32 = 4
}

class Data<T>{
    let count: T
    init(x: T){
        count = x
    }
    func getFoo<V>(x: Foo<V>): Foo<V>{
        return Foo<V>()
    }
}

func run(): Int64 {
    let foo: Foo<Int32> = Foo<Int32>()
    var data: Data<Int32> = Data<Int32>(3)
    var foo2: Foo<Int32> = data.getFoo<Int32>(foo)
    var res: Int32 = foo2.a
    if (res == 4){
        return 0
    }
    return 1
}
