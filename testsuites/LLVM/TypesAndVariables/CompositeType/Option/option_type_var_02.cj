// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func foo<T>(x: Option<T>): Option<T>{
    return x
}

func run(): Int64 {
    var opt1: Option<String> = Some<String>("Option")
    var opt2: Option<String> = None<String>
    var res1: String = match (foo<String>(opt1)) {
        case Some(x) => x
        case $None => ""
    }
    var res2: String = match (foo<String>(opt2)) {
        case Some(x) => x
        case $None => ""
    }
    if (res1 == "Option" && res2 == ""){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
