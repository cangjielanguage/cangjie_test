// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var i: UInt32 = 4294967295
    var time = Time<UInt32>.Day(i)
    var res = match (time) {
        case Day(x) => x-1
    }
    if (res == 4294967294) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

