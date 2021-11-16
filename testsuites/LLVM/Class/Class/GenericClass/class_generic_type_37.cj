// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

class Data<T>{
    var x: T
    var y: T
    init(a: T, b: T){
        x = a
        y = b
    }
}

interface I<T>{
    func getData(data: T): T
}

class Foo <: I<Data<Int32>>{
    func getData(data: Data<Int32>): Data<Int32>{
        Data<Int32>(data.x+1, data.y+1)
    }
}

func run(): Int64 {
    let data1: Data<Int32> = Data<Int32>(2, 3)
    var data2: Data<Int32> = Foo().getData(data1)
    var res1: Int32 = data2.x
    var res2: Int32 = data2.y
    if (res1 == 3 && res2 == 4){
        return 0
    }
    return 1
}
