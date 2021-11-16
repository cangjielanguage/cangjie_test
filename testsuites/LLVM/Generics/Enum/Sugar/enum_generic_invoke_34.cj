// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var i: Int64 = 9223372036854775806
    var time = Time.Day(i)
    var res = match (time) {
        case Day(x) => x-1
    }
    if (res == 9223372036854775805) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

