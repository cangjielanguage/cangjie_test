// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I<T>{
    func getOption(): T
}

class Foo <: I<Option<Int32>>{
    func getOption(): Option<Int32>{
        Option<Int32>.Some(4)
    }
}

func run(): Int64 {
    var opt: Option<Int32> = Foo().getOption()
    var res: Int32 = match (opt) {
        case Some(x) => x + 1
        case $None => 0
    }
    if (res == 5){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
