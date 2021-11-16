// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
    Year(T) | Day(T)
}

class Foo<T> {
    var time: TimeUnit<T>
    var day: TimeUnit<T>
    init(x: T, y: T){
        time = TimeUnit.Year(x)
        day = TimeUnit.Day(y)
    }
    func f(x: TimeUnit<T>): TimeUnit<T>{
        return x
    }
}

func run(): Int64 {
    var foo: Foo<Int64> = Foo<Int64>(2, 3)
    var time1 = foo.time
    var time2 = foo.day
    var time3 = foo.f(TimeUnit.Day(4))
    var res1: Int64 = match (time1) {
        case Year(x) => 2020
        case Day(x) => 16
    }
    var res2: Int64 = match (time2) {
        case Year(x) => 2020
        case Day(x) => 16
    }
    var res3: Int64 = match (time3) {
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
