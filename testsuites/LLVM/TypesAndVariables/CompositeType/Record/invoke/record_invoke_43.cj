// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T> {
    let width: T
    init(x: T){
        width = x
    }
}

func run(): Int64 {
    var list: List<Int64> = [1,2,3,4]
    let data: Data<List<Int64>> = Data<List<Int64>>(list)
    var res = data.width[2]
    if (res == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

