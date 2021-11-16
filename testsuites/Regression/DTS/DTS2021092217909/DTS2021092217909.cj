// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args

enum TimeUnit<T1, T2> {
    | Year(T1)
    | Month(T1, T2)
    | Day(T1, T2, T2)
    | Hour(T1, T2, T2, T2)
}

func main() {
    var time_Year:TimeUnit<Int64,Int32> = TimeUnit.Year(2021)
    var time_Month:TimeUnit<Int64,Int32> = TimeUnit.Month(2021,9)
    var time_Day:TimeUnit<Int64,Int32> = TimeUnit.Day(2021,9,22)

    let TimeUnit_2:Any = match (time_Year) {
        case Year(y) => y
        case Month(y,m) => m
        case Day(y,m,d) => d
        case Hour(y,m,d,h) => h
    }
}
