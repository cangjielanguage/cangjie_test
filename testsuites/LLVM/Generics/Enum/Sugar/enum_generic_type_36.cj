// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Foo<T>{
    var data: T
    init(data1: T){
        data = data1
    }
}

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    let time = Time.Day(3)
    var foo: Foo<Time<Int64>> = Foo<Time<Int64>>(time)
    var res: Int64 = match (foo.data) {
        case Day(x) => x + 1
    }
    if (res == 4){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
