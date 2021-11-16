// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

class Data<T>{
    let data: T
    init(x: T){
        data = x
    }
}

func run(): Int64 {
    let data: Data<Int32> = Data<Int32>(3)
    var data2: Data<Data<Int32>> = Data<Data<Int32>>(data)
    var res: Int32 = data2.data.data
    if (res == 3){
        return 0
    }
    return 1
}
