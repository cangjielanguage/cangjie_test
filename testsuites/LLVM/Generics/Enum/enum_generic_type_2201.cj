// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
    Year(T) | Day(T)
}

record Data<T> {
    var time: TimeUnit<T>
    var day: TimeUnit<T>
    init(x: T, y: T){
        time = TimeUnit<T>.Year(x)
        day = TimeUnit<T>.Day(y)
    }
    func f(x: TimeUnit<T>): TimeUnit<T>{
        return x
    }
}

func run(): Int64 {
    var data: Data<Int32> = Data<Int32>(2, 3)
    var time1 = data.time
    var time2 = data.day
    var time3 = data.f(TimeUnit<Int32>.Day(4))
    var res1: Int32 = match (time1) {
        case Year(x) => 2020
        case Day(x) => 16
    }
    var res2: Int32 = match (time2) {
        case Year(x) => 2020
        case Day(x) => 16
    }
    var res3: Int32 = match (time3) {
        case Year(x) => 2020
        case Day(x) => 16 + x
    }
    if ( res1 == 2020 && res2 == 16 && res3 == 20) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
