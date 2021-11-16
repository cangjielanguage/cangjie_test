// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
    Year(T) | Day(T)
}

interface I<T> {
    func foo(x: TimeUnit<T>): TimeUnit<T>
}

class Foo <: I<Int64> {
    func foo(x: TimeUnit<Int64>):TimeUnit<Int64>{
        return x
    }
}

func run(): Int64 {
    var time = Foo().foo(TimeUnit.Year(3))
    let res = match (time) {
        case Year(x) => 2020
        case Day(x) => 16
    }
    if (res == 2020) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
