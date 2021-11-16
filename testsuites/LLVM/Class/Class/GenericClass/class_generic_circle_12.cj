// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

class Foo<T>{
    var a: T
    init(x: T){
        a = x
    }
    func getNum<U>(x: U):U{
        return x
    }
}

class Data<T>{
    let count: T
    init(x: T){
        count = x
    }
    func getFoo<V>(x: Foo<Int64>): Foo<Int64>{
        var i: Int64 = x.getNum<Int64>(4)
        return Foo<Int64>(i)
    }
}

func run(): Int64 {
    let foo: Foo<Int64> = Foo<Int64>(1)
    var data: Data<Int32> = Data<Int32>(3)
    var foo2: Foo<Int64> = data.getFoo<Int64>(foo)
    var res: Int64 = foo2.a
    if (res == 4){
        return 0
    }
    return 1
}
