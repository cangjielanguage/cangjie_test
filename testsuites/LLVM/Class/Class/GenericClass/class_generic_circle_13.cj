// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Roo<T>{
    var r: T
    init(x: T){
        r = x
    }
}

class Data<T>{
    let count: T
    init(x: T){
        count = x
    }
    func getFoo<V>(x: Roo<V>): Roo<V>{
        return Roo<V>()
    }
}

func run(): Int64 {
    var a: Int32 = 3
    let roo: Roo<Int32> = Roo<Int32>(a)
    var data: Data<Int32> = Data<Int32>(a)
    var foo: Roo<Roo<Int32>> = data.getFoo<Roo<Int32>>(roo)
    var res: Int32 = foo.r
    if (res == 3){
        return 0
    }
    return 1
}
