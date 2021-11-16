// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record DataRec {
    var width: Int32 = 3
}

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var data = DataRec()
    var time = Time<DataRec>.Day(data)
    var res: Int32 = match (time) {
        case Day(x) => x.width
    }
    if (res == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
