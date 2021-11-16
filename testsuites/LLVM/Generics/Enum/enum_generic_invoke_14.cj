// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
    Year(T) | Day(T, T)
}

func run(): Int64 {
    var time1 = TimeUnit<Int32>.Year(1)
    var time2 = Day<Int32>(1, 2)
    var year: Int32 = 0
    var day: Int32 = 0
    if (true){
        year = match (time1) {
            case Year(x) => 2020+x
            case Day(x, y) => 20+x+y
        }
        day = match (time2) {
            case Year(x) => 2020+x
            case Day(x, y) => 20+x+y
        }
    }else{
        year = match (time1) {
            case Year(x) => 2020-x
            case Day(x, y) => 20-x-y
        }
        day = match (time2) {
            case Year(x) => 2020-x
            case Day(x, y) => 20-x-y
        }
    }
    if (year == 2021 && day == 23) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
