// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum Time<T>{
    Day(T)
}

interface I<T>{
    func getTime(): T
}

class Foo <: I<Time<Int32>>{
    func getTime(): Time<Int32>{
        Time<Int32>.Day(4)
    }
}

func run(): Int64 {
    var time: Time<Int32> = Foo().getTime()
    var res: Int32 = match (time) {
        case Day(x) => x + 1
    }
    if (res == 5){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
