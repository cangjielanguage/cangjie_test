// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I {
    let opt1 = Option<Int32>.None
    let opt2 = Option<Int32>.Some(4)
}

func run(): Int64 {
    let res1: Int32 = match I.opt1 {
        case Some(x) => x
        case $None => 0
    }
    let res2: Int32 = match I.opt2 {
        case Some(x) => x
        case $None => 0
    }

    if ( res1 == 0 && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
