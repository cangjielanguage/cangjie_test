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
    func foo<V>(x: Data<V>): V{
        return x.count
    }
}

func run(): Int64 {
    let data: Data<Int32> = Data<Int32>(3)
    var res: Int32 = data.foo<Int32>(data)
    if (res == 3){
        return 0
    }
    return 1
}
