// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T>{
    var dt: T
    init(x: T){
        dt = x
    }
    func area<V>(height: V): V {
        return height
    }
}

func f1<T>(x: T): T{
    return x
}

record Test {
    let f2: (Data<Int32>) -> Data<Int32> = f1<Data<Int32>>
}

func run(): Int64 {
    var i: Int32 = 2
    var data: Data<Int32> = Data<Int32>(i)
    var data2: Data<Int32> = Test().f2(data)
    let res1: Int32 = data2.dt
    var height: Int32 = 3
    let res2: Int32 = data2.area<Int32>(height)
    if ( res1 == 2 && res2 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}