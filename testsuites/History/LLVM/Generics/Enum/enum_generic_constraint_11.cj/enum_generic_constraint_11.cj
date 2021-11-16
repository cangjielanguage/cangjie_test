// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Add<T> {
    func autoInc(left: This, step: T): String
}

append Int64 with Add<Int64> {
    func autoInc(left: Int64, step: Int64): String{
        return left.toString() + step.toString()
    }
}

enum Time<T>
    where T <: Add<Int64> {
    Day(T)
}

func run(): Int64 {
    var i: Int64 = 4
    var time = Time<Int64>.Day(i)
    var res: String = match (time) {
        case Day(x) => autoInc(x, 2)
    }
    if ( res == "42") {
        return 0
    }
    return 1
}


func main(): Int64 {
    return run()
}
