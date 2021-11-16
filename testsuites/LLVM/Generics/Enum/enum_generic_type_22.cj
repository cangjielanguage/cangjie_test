// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> { Day(T) }

record test {
    test(let time : TimeUnit<Int32>) {}
}

func run(): Int64 {
    let data = test(TimeUnit<Int32>.Day(14))
    let time = data.time
    
    var res: Int32 = match (time) {
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