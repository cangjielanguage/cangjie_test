// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T> {
    let width: T
    init(x: T){
        width = x
    }
}

func run(): Int64 {
    var listf64: ListFloat64 = ListFloat64(5, 10.0)
    let data: Data<ListFloat64> = Data<ListFloat64>(listf64)
    var i: Int32 = 2
    var res = data.width.get(2)
    if (res == 10.000000) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
