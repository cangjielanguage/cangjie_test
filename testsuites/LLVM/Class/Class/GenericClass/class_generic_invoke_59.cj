// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit { Day(Int32) }

class Data<T> {
    let timeEnum: T
    init(x: T){
        timeEnum = x
    }
}

func run(): Int64 {
    let time: TimeUnit = TimeUnit.Day(14)
    let data: Data<TimeUnit> = Data<TimeUnit>(time)
    var timeEnum: TimeUnit = data.timeEnum
    var res: Int32 = match (timeEnum) {
        case Day(x) => 2
    }
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
