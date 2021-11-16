// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface Ioo {
    let a: Int32 = 2
}

class Coo <: Ioo{
    var b: Int32 = 3
}

enum Time<T> {
    Day(T)
}


func run(): Int64 {
    var coo: Coo= Coo()
    var time = Time.Day(coo)
    var res: Int32 = match time {
        case Day(x) => x.b + 2
    }
    if ( res == 5) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
