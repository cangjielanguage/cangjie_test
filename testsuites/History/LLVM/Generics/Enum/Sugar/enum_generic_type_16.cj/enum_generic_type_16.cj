// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
    Month(T) | Day(T)
}

trait Num {
    func plus(a: This, b: This): This
}

append TimeUnit<Int64> with Num {
    func plus(a: TimeUnit<Int64>, b: TimeUnit<Int64>): TimeUnit<Int64> { b }
}

func run(): Int64 {
    let time = plus(TimeUnit.Month(5) , TimeUnit.Day(14))
    
    var res: Int64 = match (time) {
        case Month(x) => 1
        case Day(x) => 2
    }  

    if (res == 2) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}