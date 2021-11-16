// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class A {
    protected var opt: Option<String> = Some<String>("option")
}
class SubB <: A {
    var str: String
    init() {
        str = match (opt) {
            case Some(x) => x
            case $None => ""
        }
    }
}

func run(): Int64 {
    var sub = SubB()
    if(sub.str == "option"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
