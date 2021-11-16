// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum Time<T> {
    Day(T)
}

func run(): Int64 {
    var time = Time<Int32>.Day(2)
    var tup: Int32*Time<Int32> = (1, time)
    var getTime: Time<Int32> = tup[1]
    var res: Int32 = match (getTime) {
        case Day(x) => x + 2
    }
    if (res == 4){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}