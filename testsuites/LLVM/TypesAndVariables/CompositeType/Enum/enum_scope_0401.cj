// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit { Day }

var time = TimeUnit.Day

var res: Int32 = match (time) {
    case $Day => 2
}

func main(): Int64 {
    if (res == 2) {
        return 0
    }
    return 1
}
