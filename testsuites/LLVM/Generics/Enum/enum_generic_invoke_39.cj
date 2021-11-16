// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var i: Float16 = 6.104e-5
    var time = Time<Float16>.Day(i)
    var res = match (time) {
        case Day(x) => x
    }
    if (res == 6.104e-5) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

