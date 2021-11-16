// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var ut: Unit = ()
    var time = Time<Unit>.Day(ut)
    var res = match (time) {
        case Day(x) => x
    }
    if (res == ut) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

