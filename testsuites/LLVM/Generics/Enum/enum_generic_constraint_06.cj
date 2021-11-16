// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Foo<T> {
    var dt: T
    init(x: T){
        dt = x
    }
}

enum Time<T>
    where T <: Foo<String> {
    Day(T)
}

func run(): Int64 {
    let foo: Foo<String>= Foo<String>("hello")
    var time = Time<Foo<String>>.Day(foo)
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
