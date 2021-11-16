// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record Data {
    var width: Int32 = 3
}

enum Time<T> where T <: Data {
    Day(T)
}

func run(): Int64 {
    var data = Data()
    var time = Time.Day(data)
    var res: Int32 = match (time) {
        case Day(x) => x.width
    }
    if (res == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
