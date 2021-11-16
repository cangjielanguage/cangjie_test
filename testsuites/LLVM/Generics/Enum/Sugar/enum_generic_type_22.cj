// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> { Day(T) }

record test {
    test(let time : TimeUnit<Int64>) {}
}

func run(): Int64 {
    let data = test(TimeUnit.Day(14))
    let time = data.time
    
    var res = match (time) {
        case Day(x) => x + 2
    }  

    if (res == 16) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}