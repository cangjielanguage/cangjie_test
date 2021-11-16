// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> { Month }

func getValue<T>(): TimeUnit<T> {
    return TimeUnit<T>.Month
}

func run(): Int64 {
    var time = getValue<Int64>()
    var res = match (time) {
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