// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func getHeight<V>(height: V): V{
    return  height
}

class Data<T> {
    let width: T

    init(x: T){
        width = x
    }
}

func run(): Int64 {
    let data: Data<(Int64)->Int64> = Data<(Int64)->Int64>(getHeight<Int64>)
    var res = data.width(4)
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

