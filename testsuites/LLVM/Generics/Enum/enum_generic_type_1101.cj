// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> { Day }

func foo<T>(x: TimeUnit<T>): TimeUnit<T> {
    return x
}

func run(): Int64 {
    var time = foo<Int32>(TimeUnit<Int32>.Day)
    var res: Int32 = match (time) {
        case $Day => 23
    }
    if (res == 23) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}