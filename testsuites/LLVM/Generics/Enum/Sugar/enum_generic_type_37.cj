// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum Time<T>{
    Day(T)
}

interface I<T>{
    func getTime(): T
}

class Foo <: I<Time<Int64>>{
    func getTime(): Time<Int64>{
        Time<Int64>.Day(4)
    }
}

func run(): Int64 {
    var time = Foo().getTime()
    var res = match (time) {
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
