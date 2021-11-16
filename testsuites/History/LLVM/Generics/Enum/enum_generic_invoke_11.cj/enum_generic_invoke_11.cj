// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
    Year(T) | Day(T)
}

trait Add {
    func add(left: This, right: This): This
}

append TimeUnit<Int32> with Add {
    func add(left: TimeUnit<Int32>, right: TimeUnit<Int32>): TimeUnit<Int32> {
        return right
    }
}


func run(): Int64 {
    var time: TimeUnit<Int32> = add(TimeUnit<Int32>.Year(3), TimeUnit<Int32>.Day(3))
    var res: Int32 = match (time) {
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
