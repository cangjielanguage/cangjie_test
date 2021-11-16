// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit { Day }

func run(time : TimeUnit): Int64 {
    var time1 = time
    var res: Int32 = match (time1) {
        case $Day => 14
    }  

    if (res == 14) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run(TimeUnit.Day)
}