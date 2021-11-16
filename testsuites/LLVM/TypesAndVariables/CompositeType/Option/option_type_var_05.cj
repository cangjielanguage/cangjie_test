// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Foo {
    var opt: Option<Int32> = Option<Int32>.None
    init(x: Option<Int32>){
        opt = x
    }
    func f(x: Option<Int32>): Option<Int32>{
        return x
    }
}

func run(): Int64 {
    var foo1: Foo= Foo(Option<Int32>.Some(2))
    var foo2: Foo = Foo(Option<Int32>.None)
    var opt1 = foo1.opt
    var opt2 = foo1.f(Option<Int32>.Some(3))
    var opt3 = foo2.opt
    var opt4 = foo2.f(Option<Int32>.None)
    var res1: Int32 = match (opt1) {
        case Some(x) => x
        case $None => -1
    }
    var res2: Int32 = match (opt2) {
        case Some(x) => x
        case $None => -1
    }
    var res3: Int32 = match (opt3) {
        case Some(x) => x
        case $None => -1
    }
    var res4: Int32 = match (opt4) {
        case Some(x) => x
        case $None => -2
    }

    if ( res1 == 2 && res2 == 3 && res3 == -1 && res4 == -2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
