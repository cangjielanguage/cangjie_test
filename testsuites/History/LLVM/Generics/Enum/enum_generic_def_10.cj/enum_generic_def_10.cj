// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Add {
    func autoInc(left: This, step: This): This
}

append Int32 with Add {
    func autoInc(left: Int32, step: Int32): Int32{
        return left + step
    }
}

enum TimeUnit<T>
    where T <: Add {
    Year(T)
}

func run(): Int64 {
    var time= TimeUnit<Int32>.Year(4)
    let res: Int32 = match (time) {
        case Year(x) => autoInc(x, 4)
        case _ => 0
    }
    if ( res == 8) {
        return 0
    }
    return 1
}


func main(): Int64 {
    return run()
}
