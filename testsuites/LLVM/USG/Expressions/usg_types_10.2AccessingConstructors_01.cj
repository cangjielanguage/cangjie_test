// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit1 {
    Year(Int32) | Month(Int32) | Day
}

func main(){
    // 1. 一般调用
    var a: Int32 = 1
    let time1 = TimeUnit1.Year(a)
    let time2 = TimeUnit1.Day
    // 2. 语法糖调用
    let time3 = Year(a)
    let time4 = Day

    return 0
}

