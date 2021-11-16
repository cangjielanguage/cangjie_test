// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I<T> {
    func foo(x: Option<T>): Option<T>
}

class Foo <: I<Int32> {
    func foo(x: Option<Int32>): Option<Int32>{
        return x
    }
}

func run(): Int64 {
    var opt1 = Foo().foo(Option<Int32>.Some(3))
    var opt2 = Foo().foo(Option<Int32>.None)
    let res1: Int32 = match (opt1) {
        case Some(x) => x
        case $None => 0
    }
    let res2: Int32 = match (opt2) {
        case Some(x) => x
        case $None => 0
    }
    if (res1 == 3 && res2 ==0) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
