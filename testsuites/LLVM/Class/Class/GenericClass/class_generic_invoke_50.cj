// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T> {
    let width: T
    init(x: T){
        width = x
    }
}

func run(): Int64 {
    var listf64: List<Float64> = [10.000000, 10.000000, 10.000000, 10.000000]
    let data: Data<List<Float64>> = Data<List<Float64>>(listf64)
    var i: Int32 = 2
    var res = data.width[2]
    if (res == 10.000000) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
