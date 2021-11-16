// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> { Day(T) }

func run(time : TimeUnit<Int32>): Int64 {
    var time1 = time
    var res: Int32 = match (time1) {
        case Day(x) => x + 1
    }  

    if (res == 3) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run(TimeUnit<Int32>.Day(2))
}