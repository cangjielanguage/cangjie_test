// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I<T> {
    let opt1 = Option<T>.None
}

func run(): Int64 {
    let res1: Int32 = match I<Int32>.opt1{
        case Some(x) => x
        case $None => 0
    }

    if ( res1 == 0 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
