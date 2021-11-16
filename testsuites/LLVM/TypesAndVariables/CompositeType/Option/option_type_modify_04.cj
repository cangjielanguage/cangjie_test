// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class A {
    public var opt: Option<String> = Some<String>("option")
}

class B {
    var str: String = match (A().opt) {
        case Some(x) => x
        case $None => ""
    }
}

func run(): Int64 {
    var b = B()
    if(b.str == "option"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
