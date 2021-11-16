// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
    Year(T) | Day(T)
}

trait Add {
    func add(left: This, right: This): This
}

append TimeUnit<Int64> with Add {
    func add(left: TimeUnit<Int64>, right: TimeUnit<Int64>): TimeUnit<Int64> {
        return right
    }
}


func run(): Int64 {
    var time  = add(TimeUnit.Year(3), TimeUnit.Day(3))
    var res = match (time) {
        case Year(x) => 2020
        case Day(x) => 17
    }
    if ( res == 17) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
