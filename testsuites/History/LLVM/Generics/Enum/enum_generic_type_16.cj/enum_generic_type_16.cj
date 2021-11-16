// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
    Month(T) | Day(T)
}

trait Num {
    func plus(a: This, b: This): This
}

append TimeUnit<Int32> with Num {
    func plus(a: TimeUnit<Int32>, b: TimeUnit<Int32>): TimeUnit<Int32> { b }
}

func run(): Int64 {
    let time : TimeUnit<Int32>  = plus(TimeUnit<Int32>.Month(5) , TimeUnit<Int32>.Day(14))
    
    var res: Int32 = match (time) {
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