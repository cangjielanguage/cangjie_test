// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func foo1(): Option<String>{
    return Option<String>.Some("Option")
}

func foo2(): Option<String>{
    return Option<String>.None
}

func run(): Int64 {

    var res1: String = match (foo1()) {
        case Some(x) => x
        case $None => ""
    }

    var res2: String = match (foo2()) {
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

