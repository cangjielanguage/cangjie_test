// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data{
    var a:Int32
    init(x:Int32){a=x}
}

func foo1(): Option<Data>{
    return Option<Data>.Some(Data(1))
}

func foo2(): Option<Data>{
    return Option<Data>.None
}

func run(): Int64 {

    var res1: Data = match (foo1()) {
        case Some(x) => x
        case $None => Data(0)
    }

    var res2: Data = match (foo2()) {
        case Some(x) => x
        case $None => Data(0)
    }

    if (res1.a == 1 && res2.a == 0){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

