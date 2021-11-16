// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T1, T2, T3> {
    Year(T2) | Month(T2) | Day(T3)
}

func run(): Int64 {
    var year = TimeUnit<Unit,Float64,Unit>.Year(4.0)
    var month = TimeUnit<Unit,Float64,Unit>.Month(9.0)
    var day = TimeUnit<Unit,Unit,String>.Day("星期三")
    var res1: Float64 = match (year) {
        case Year(x) => 2020.001
        case Month(x) => 9.0
        case Day(x) => 9.0
    }
    var res2: Float64 = match (month) {
        case Year(x) => 2020.0
        case Month(x) => 9.0
        case Day(x) => 9.0
    }
    var res3: String = match (day) {
        case Year(x) => "2020"
        case Month(x) => "9"
        case Day(x) => "16"
    }
    if (res1 == 2020.001 && res2 == 9.0 && res3 =="16"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
