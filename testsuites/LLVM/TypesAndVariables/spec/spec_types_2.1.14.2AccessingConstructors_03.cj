// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


enum TimeUnit3<T1,T2> {
    | Year(T1)
    | Month(T1,T2)
    | Day(T1, T2, T2)
    | Hour(T1, T2, T2, T2)
}


func main(){
    let time6 = Day<Int64, Float64>(1, 2.0, 3.0)
    return 0
}

