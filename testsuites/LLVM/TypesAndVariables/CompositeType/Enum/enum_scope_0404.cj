// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit { Day }

class A{
    var time: TimeUnit = TimeUnit.Day
}

func main(): Int64 {
    var time1 = A().time
    var res: Int32 = match (time1) {
        case $Day => 2
    }

    if (res == 2) {
        return 0
    } else {
        return 1
    }
}
