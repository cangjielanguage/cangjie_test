// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var f: Float32 = 1.18e-38
    var time = Time<Float32>.Day(f)
    var res = match (time) {
        case Day(x) => x
    }
    if (res == 1.18e-38) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

