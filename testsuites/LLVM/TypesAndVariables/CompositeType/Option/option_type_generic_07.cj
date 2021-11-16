// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Foo<T>{
    var data: T
    init(data1: T){
        data = data1
    }
}

func run(): Int64 {
    let opt = Option<Int32>.Some(3)
    var foo: Foo<Option<Int32>> = Foo<Option<Int32>>(opt)
    var res: Int32 = match (foo.data) {
        case Some(x) => x + 1
        case $None => 0
    }
    if (res == 4){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
