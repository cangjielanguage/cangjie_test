// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

class Data<T>{
    let count: T
    init(x: T){
        count = x
    }
    func foo<V>(x: V): Data<V>{
        return Data<V>(x)
    }
}

func run(): Int64 {
    let data: Data<Int32> = Data<Int32>(3)
    var data2: Data<Int64> = data.foo<Int64>(4)
    var res: Int64 = data2.count
    if (res == 4){
        return 0
    }
    return 1
}
