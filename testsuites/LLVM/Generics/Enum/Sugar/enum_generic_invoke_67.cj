// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum Time<T>{
    Day(T) | Hour(T)
}

func run(): Int64 {
    let array: Array<Int32> = @{1,2}
    let array2: Array<Array<Int32>> = @{@{1,2},@{3,4}}
    var time1 = Time.Day(array)
    var time2 = Time.Hour(array2)
    var res1: Int32 = match (time1) {
        case Day(x) =>x[1]
        case Hour(x) => 1
    }
    var res2: Int32 = match (time2) {
        case Day(x) => 1
        case Hour(x) =>x[1][1]
    }
    if (res1 == 2 && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
