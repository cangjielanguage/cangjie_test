// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum Time<T> {
    Day(T)
}

func run(): Int64 {
    var time = Time.Day(2)
    var tup: Int32*Time<Int64> = (1, time)
    var getTime = tup[1]
    var res = match (getTime) {
        case Day(x) => x + 2
    }
    if (res == 4){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}