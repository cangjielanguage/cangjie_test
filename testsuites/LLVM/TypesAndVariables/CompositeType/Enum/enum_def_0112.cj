// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var vYear:Int32 = 2000
enum TimeUnit {
    Year | Month
}

func run(): Int64 {
    var time = Year
    var res: Int32 = match (time) {
        case $Year => vYear
        case $Month => 1
    }

    if (res == 2000) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}

