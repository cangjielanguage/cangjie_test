// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo()
    if( res == 2) {
        return 0
    }
    return 1
}


func Foo(a!:Option<Int64>=Option<Int64>.Some(10)){
    var res : Int64 = match (a) {
        case Some(100)=> 1
        case Some(_)=> 2
        case Some(x)=> 3
        case Some(10)=> 4
        case $None => 5
        case _ => 6
    }
    return res
}

