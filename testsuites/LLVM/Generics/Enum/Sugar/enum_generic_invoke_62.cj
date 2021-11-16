// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Foo<T> {
    var a: T
    init(a1: T){
        a = a1
    }
}

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var foo: Foo<Char>= Foo<Char>('a')
    var time = Time.Day(foo)
    var res: String = match (time) {
        case Day(x) => x.a.toString()
    }
    if (res == "a") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
