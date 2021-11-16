// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> { Month }

func getValue<T>() : TimeUnit<T> {
    return TimeUnit<T>.Month
}

func run(): Int64 {
    var time = getValue<Int32>()
    var res: Int32 = match (time) {
        case $Month => 5
    }  

    if (res == 5) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}