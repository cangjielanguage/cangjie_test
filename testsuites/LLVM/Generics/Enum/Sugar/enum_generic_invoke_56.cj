// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func getTime<V>(x: V): V{
    return x
}

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var time = Time.Day(getTime<Int32>)
    var res: Int32 = match (time) {
        case Day(x) => x(3)
    }
    if (res == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

