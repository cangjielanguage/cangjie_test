// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> { Day(Int32) }

interface A {
    let b = TimeUnit<Int64>.Day(14)
}

func run(): Int64 {
    var time = A.b
    var res: Int32 = match time {
        case Day(x) => x + 2
    }
    if ( res == 16 ) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
