// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T1> {
    let count: T1

    init(x: T1){
        count = x
    }
}

func run(): Int64 {
    var i: Int64 = 4
    let data: Data<Int64> = Data<Int64>(i)
    var res: Int64 = data.count
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

