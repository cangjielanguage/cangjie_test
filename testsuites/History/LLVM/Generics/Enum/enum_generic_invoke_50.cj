// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var listf64: ListFloat64 = ListFloat64(10, 10.0)
    var time = Time<ListFloat64>.Day(listf64)
    var res: Float64 = match (time) {
        case Day(x) => x.get(2)
    }
    if (res == 10.000000) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
