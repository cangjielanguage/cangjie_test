// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Foo<T> {
    var dt: T
    init(x: T){
        dt = x
    }
}

enum Time<T> {
    Day(T)
}

func run(): Int64 {
    let foo: Foo<String>= Foo<String>("hello")
    var time = Time.Day(foo)
    var res: String = match (time) {
        case Day(x) => x.dt
    }
    if (res == "hello") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
