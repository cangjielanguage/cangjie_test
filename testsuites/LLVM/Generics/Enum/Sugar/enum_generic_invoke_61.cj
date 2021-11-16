// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Foo {
    var dt: Int32 = 2
}

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var foo: Foo= Foo()
    var time = Time.Day(foo)
    var res: Int32 = match (time) {
        case Day(x) => x.dt + 2
    }
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
