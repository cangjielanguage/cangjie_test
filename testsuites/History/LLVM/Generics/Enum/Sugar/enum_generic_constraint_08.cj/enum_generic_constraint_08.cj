// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait Add {
    func autoInc(left: This, step: Int64): This
}

append Int64 with Add {
    func autoInc(left: Int64, step: Int64): Int64{
        return left + step
    }
}

enum Time<T> {
    Day(T)
}

func run(): Int64 {
    var time = Time.Day(4)
    var res: Int64 = match (time) {
        case Day(x) => autoInc(x, 2)
    }
    if ( res == 6) {
        return 0
    }
    return 1
}


func main(): Int64 {
    return run()
}
