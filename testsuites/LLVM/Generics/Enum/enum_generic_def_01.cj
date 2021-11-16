// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
    Year(T)
}

func run(): Int64 {
    var time = TimeUnit<Int64>.Year(20)
    var res: Int64 = match (time) {
        case Year(20) => 2020
        case _ => 0
    }
    if (res == 2020) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

