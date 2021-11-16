// EXEC: %compiler %cmp_opt %n.cj -o %output
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
    let time = Time<Int32>.Day(3)
    var foo: Foo<Time<Int32>> = Foo<Time<Int32>>(time)
    var res: Int32 = match (foo.data) {
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
