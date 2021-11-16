// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args



record Data<T>{
    var opt: T
    init(opt1: T){
        opt = opt1
    }
}

func run(): Int64 {
    let opt1 = Option<Int32>.Some(2)
    var data: Data<Option<Int32>> = Data<Option<Int32>>(opt1)
    var opt2: Option<Int32> = data.opt
    var res: Int32 = match (opt2) {
        case Some(x) => x + 1
        case $None => 0
    }
    if (res == 3){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}