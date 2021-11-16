// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface Base {
    let a: Int32 = 1
}

class Data <: Base {
    static let b:Int32 = Base.a
}

func run(): Int64 {
    if Base.a != 1 {
        return 1
    }
    if Data.b != 1 {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
