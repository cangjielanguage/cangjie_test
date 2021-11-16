// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum Time<T> {
    Day(T)
}

record Data<T>{
    var time: T
    init(time1: T){
        time = time1
    }
}

func run(): Int64 {
    let time1 = Time<Int32>.Day(2)
    var data: Data<Time<Int32>> = Data<Time<Int32>>(time1)
    var time2: Time<Int32> = data.time
    var res: Int32 = match (time2) {
        case Day(x) => x + 1
    }
    if (res == 3){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}