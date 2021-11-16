// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
    Hour
}

interface I<T> {
    let time = TimeUnit<T>.Hour
}

func run(): Int64 {
    let res1: Int32 = match I<Int32>.time{
        case $Hour => 11
    }

    if ( res1 == 11 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

