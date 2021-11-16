// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit2<T> {
    Year(T) | Month(T) | Day
}


func main(){
    // 1. 一般调用
    var a: Int32 = 1
    let timeT1 = TimeUnit2<Int32>.Year(a)
    let timeT2 = TimeUnit2<Int32>.Day
    // 2. 语法糖调用
    let timeT3 = Year<Int32>(a)
    let timeT4 = Day<Int32>
    return 0
}

